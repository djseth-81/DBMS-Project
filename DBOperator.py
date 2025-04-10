# connector to our database
import sqlite3
# custom types for each entity we're manipulating
from entities import *

class DBOperator:
    """
    represents a single database connection, handles
    connection, cursor, transactions, and crud
    """

    def __init__(self, db_file: str = 'project.db') -> None:
        # store the path to the database file
        self.__db_file: str = db_file
        # initialize connection and cursor placeholders
        self.__db: Optional[sqlite3.Connection] = None
        self.__cursor: Optional[sqlite3.Cursor] = None
        # attempt to connect
        self._connect()

    def _connect(self) -> None:
        """establishes the database connection and cursor"""
        try:
            # connect to the sqlite database.
            # TODO: this automatically creates the file if it doesn't exist, but we never want to do that
            self.__db = sqlite3.connect(self.__db_file)
            # enable foreign key constraints
            self.__db.execute("PRAGMA foreign_keys = ON;")
            self.__cursor = self.__db.cursor()
            print(f"info: successfully connected to database '{self.__db_file}'.")
        except sqlite3.Error as e:
            # print error if connection fails
            print(f"error: failed to connect to database '{self.__db_file}': {e}", file=sys.stderr)
            # ensure resources are cleaned up
            self.__db = None
            self.__cursor = None

    def is_connected(self) -> bool:
        return self.__db is not None and self.__cursor is not None

    # mutators
    def add(self, table: str, entity: Dict[str, Any]) -> Optional[int]:
        """
        adds a single row to the specified table.
        returns the row id if successful, otherwise none.
        requires commit() to save changes permanently.
        """
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return None
        # check for empty data
        if not entity:
            print("warning: add operation called with empty entity data.", file=sys.stderr)
            return None

        # prepare column names and placeholders
        attrs = ','.join(entity.keys())
        values = list(entity.values())
        placeholders = ','.join(['?'] * len(values))

        # construct the sql insert statement
        sql = f"INSERT INTO {table} ({attrs}) VALUES ({placeholders})"

        try:
            self.__cursor.execute(sql, tuple(values))
            return self.__cursor.lastrowid
        except sqlite3.Error as e:
            print(f"error: failed to queue add operation for table '{table}': {e}", file=sys.stderr)
            self.rollback()
            return None

    def modify(self, table: str, identifier: Tuple[str, Any], data: Dict[str, Any]) -> bool:
        """
        modifies existing rows in a table based on an identifier.
        returns true if the command was queued successfully, false otherwise.
        note: requires commit() to save changes permanently.

        :param table: the name of the table to update.
        :param identifier: a tuple (column_name, value) to identify the row(s) to update.
        :param data: a dictionary {column_to_update: new_value}.
        """
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return False
        # check for empty update data
        if not data:
            print("warning: modify operation called with no data to update.", file=sys.stderr)
            return False

        # prepare set clauses and values
        set_clauses = []
        values = []
        for key, val in data.items():
            set_clauses.append(f"{key} = ?")
            values.append(val)

        # should not happen if data is not empty, but check anyway
        if not set_clauses:
            return False

        # add the identifier value for the where clause
        values.append(identifier[1])
        where_clause = f"{identifier[0]} = ?"

        # construct the sql update statement
        sql = f"UPDATE {table} SET {', '.join(set_clauses)} WHERE {where_clause}"

        try:
            self.__cursor.execute(sql, tuple(values))
            print(f"info: modify request for table '{table}' queued.")
            return True
        except sqlite3.Error as e:
            print(f"error: failed to queue modify operation for table '{table}': {e}", file=sys.stderr)
            self.rollback()
            return False

    def delete(self, table: str, conditions: Dict[str, Any]) -> bool:
        """
        deletes rows from a table based on specified conditions.
        returns true if the command was queued successfully, false otherwise.
        note: requires commit() to save changes permanently.

        :param table: the name of the table.
        :param conditions: a dictionary {column_name: value} for the where clause.
        """
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return False
        # prevent accidental full table delete
        if not conditions:
            print("error: delete operation requires conditions. use clear() to delete all rows.", file=sys.stderr)
            return False

        print(f"info: preparing to delete from '{table}' where {conditions}")

        # prepare where clauses and values
        where_clauses = []
        values = []
        for attr, value in conditions.items():
            where_clauses.append(f"{attr} = ?")
            values.append(value)

        # construct the sql delete statement
        sql = f"DELETE FROM {table} WHERE {' AND '.join(where_clauses)}"

        try:
            self.__cursor.execute(sql, tuple(values))
            return True
        except sqlite3.Error as e:
            print(f"error: failed to queue delete operation for table '{table}': {e}", file=sys.stderr)
            self.rollback()
            return False

    def clear(self, table: str) -> bool:
        """
        removes all entries from the specified table. use with extreme caution!
        returns true if the command was queued successfully, false otherwise.
        note: requires commit() to save changes permanently.
        """
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return False
        try:
            # execute the delete command without a where clause
            self.__cursor.execute(f"DELETE FROM {table}")
            print(f"warning: clear request for table '{table}' queued. this will delete all rows upon commit.")
            return True
        except sqlite3.Error as e:
            # print error and rollback transaction on failure
            print(f"error: failed to queue clear operation for table '{table}': {e}", file=sys.stderr)
            self.rollback()
            return False

    # transaction management
    def commit(self) -> None:
        """commits the current transaction to the database."""
        if not self.is_connected():
            print("error: no database connection available to commit.", file=sys.stderr)
            return
        try:
            self.__db.commit()
            print("info: transaction committed successfully.")
        except sqlite3.Error as e:
            print(f"error: failed to commit transaction: {e}", file=sys.stderr)

    def rollback(self) -> None:
        """rolls back the current transaction, discarding changes since the last commit."""
        if not self.is_connected():
            print("info: rollback called but no active connection or transaction.")
            return
        try:
            self.__db.rollback()
            print("info: transaction rolled back.")
        except sqlite3.Error as e:
            print(f"error: failed to rollback transaction: {e}", file=sys.stderr)

    # connection management
    def close(self) -> None:
        """
        closes the database connection gracefully.
        """
        # rollback any pending changes before closing
        self.rollback()
        if self.__cursor:
            try:
                self.__cursor.close()
            except sqlite3.Error as e:
                print(f"warning: error closing cursor: {e}", file=sys.stderr)
            self.__cursor = None
        if self.__db:
            try:
                self.__db.close()
                print(f"info: connection to database '{self.__db_file}' closed.")
            except sqlite3.Error as e:
                print(f"warning: error closing database connection: {e}", file=sys.stderr)
            self.__db = None

    # accessors
    def query(self, table: str, conditions: Dict[str, Any] = None) -> List[Dict[str, Any]]:
        """
        queries rows from a table based on specified conditions.
        returns a list of dictionaries, where each dictionary represents a row.
        if conditions is none or empty, returns all rows (like get_table).
        """
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return []

        params = tuple()
        sql = f"SELECT * FROM {table}"

        # add where clause if conditions are provided
        if conditions:
            where_clauses = []
            values = []
            for attr, value in conditions.items():
                # handle 'like' queries if value contains '%'
                if isinstance(value, str) and '%' in value:
                     where_clauses.append(f"{attr} LIKE ?")
                else:
                     where_clauses.append(f"{attr} = ?")
                values.append(value)

            if where_clauses:
                sql += f" WHERE {' AND '.join(where_clauses)}"
                params = tuple(values)
            else:
                # none of the incoming conditions resulted in clauses...
                pass

        try:
            self.__cursor.execute(sql, params)
            # get table details from cursor description
            if self.__cursor.description:
                # get column names from cursor description
                columns = [description[0] for description in self.__cursor.description]
                # fetch all rows and format them as dictionaries
                return [dict(zip(columns, row)) for row in self.__cursor.fetchall()]
            else:
                # query did not return results
                return []
        except sqlite3.Error as e:
            print(f"error: failed to execute query on table '{table}': {e}", file=sys.stderr)
            return []

    def get_table(self, table: str) -> List[Dict[str, Any]]:
        # shorthand for query base case
        return self.query(table=table, conditions=None)

    def get_count(self, table: str) -> int:
        """
        returns the total number of rows in the specified table or -1 on error
        """
        # check for active connection
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return -1
        try:
            self.__cursor.execute(f"SELECT COUNT(*) FROM {table}")
            result = self.__cursor.fetchone()
            return result[0] if result else 0
        except sqlite3.Error as e:
            print(f"error: failed to get count for table '{table}': {e}", file=sys.stderr)
            return -1

    # raw sql execution
    def execute_raw_sql(self, sql: str) -> Union[List[Dict[str, Any]], int, None]:
        """
        executes an arbitrary sql statement.
        for select queries, returns a list of dictionaries.
        for insert/update/delete, returns the number of affected rows after commit.
        for other sql commands (create, drop, etc.), returns none after commit.
        automatically handles commit/rollback for non-select statements.

        :param sql: the sql statement to execute.
        :param params: optional tuple of parameters for placeholder substitution.
        :return: query results, row count, or none depending on the sql type.
        """
        if not self.is_connected():
            print("error: no database connection available.", file=sys.stderr)
            return None

        sql_command = sql.strip().upper()
        is_select = sql_command.startswith("SELECT") or sql_command.startswith("PRAGMA")

        try:
            self.__cursor.execute(sql)

            if is_select:
                # fetch results for select queries
                if self.__cursor.description:
                    columns = [description[0] for description in self.__cursor.description]
                    return [dict(zip(columns, row)) for row in self.__cursor.fetchall()]
                else:
                    return []
            else:
                # for non-select, commit the change and return affected row count
                rowcount = self.__cursor.rowcount
                self.commit()
                print(f"info: raw sql executed successfully. affected rows: {rowcount}")
                return rowcount

        except sqlite3.Error as e:
            print(f"error: failed to execute raw sql: {e}", file=sys.stderr)
            if not is_select:
                self.rollback()
            return None
