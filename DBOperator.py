from pprint import pprint
from sqlite3 import connect
from json import loads, dumps

class DBOperator():
    """
    A basic Class that will directly interface with a specified SQL database
    """

    def __init__(self, table='', host='', port='', user='',
                 passwd='', schema='public', db='demo') -> None:
        self.table = table
        self.__host = host
        self.__port = port
        self.__user = user
        self.__passwd = passwd

        try:
            self.__db = connect(db)
            self.__cursor = self.__db.cursor()
            print("### DBOperator: Connected to DB")
            # self.permissions = self.__get_privileges()
            # self.attrs = self.__get_attributes()
        except Exception as e:
            print(f"### DBOperator: Error connecting to database:\n{e}")

    ### Mutators ###
    def add(self, entity: dict) -> None:
        """
        Adds entry to connected table
        Expects a dict = {key: value} to enter as attribute and value
        """
        # Format keys as attributes for INSERT INTO cmd
        attrs = ','.join(entity.keys())

        # Define values array for pruning LATER...
        values = [value for value in entity.values()]

        # Pre-formatting SQL command.
        #   Add table, formatted attributes string, and the number of %s to add for values
        cmd = f'''
            INSERT INTO {self.table} ({attrs})
            VALUES ({'%s,' * (len(values))})'''

        # NOW we convert values into tuples
        values = tuple(values)

        try:
            self.__cursor.execute(cmd, (values))
            print("### DBOperator: Entry added to commands queue")
        except Exception as e:
            print(f"### DBOperator ERROR: Unable to add entity: {e}")

    def modify(self, entity: tuple, data: dict) -> None:
        """
        Modifys a singular exisitng entity
        """
        # Disgusting
        cmd = f"UPDATE {self.table} SET "
        for i, (key, val) in enumerate(data.items()):
            cmd += f"{key} = {val}" if type(val) != str else f"{key} = '{val}'"
            if i < (len(data.items()) - 1):
                cmd += ","

        self.__cursor.execute(cmd + f" WHERE {entity[0]} = %s", (entity[1],))

    def delete(self, entity: dict) -> None:
        """
        deletes entry that has matching attributes ONLY.
        """
        # NOTE: NO indication that delete is called on non-existent values.
        # Assumes value exists, and just deletes nothing

        if len(entity) == 0:
            raise AttributeError(
                "### DBOperator: Error. Provided entity is empty.")

        print(f"### DBOperator: Deleting {entity}")

        conditions = []
        values = []

        for attr, value in entity.items():
            conditions.append(f"{attr} = %s")
            values.append(value)

        if not conditions:
            return []

        query = f"""
            DELETE FROM ONLY {self.table}
            WHERE {' AND '.join(conditions)}
        """
        try:
            self.__cursor.execute(query, tuple(values))
            print("### DBOperator: Deletion reqeust added to queue.")
        except Exception as e:
            print(f"{e}\n### DBOperator: Error deleting item.")
            self.rollback()  # Uhm... Why are you necessary so other commands don't break?

    def clear(self) -> tuple:
        """
        Clears all entries from table
        """
        self.__cursor.execute(f"DELETE FROM {self.table}")
        return ("message", "table cleared.")

    # commit command
    def commit(self) -> tuple:
        self.__db.commit()
        print("### DBOperator: Commands submitted.")
        return ("message", "Committed.")

    # rollback command
    def rollback(self) -> tuple:
        self.__db.rollback()
        print("### DBOperator: Dumped cursor commands.")
        return ("message", "Rollback executed.")

    def close(self) -> tuple:
        """
        Closes table connection
        """
        self.__cursor.close()
        self.__db.close()
        print("### DBOperator: Connection closed.")
        return ("message", "DB instance closed.")

    ### Accessors ###
    def __get_attributes(self) -> dict:
        """
        Fetches table attributes
        """
        pass

    # Fetching tables in DB --> Dev option!
    def __get_tables(self) -> list:
        """
        Fetching tables in DB
        """
        pass

    def __get_privileges(self) -> dict:
        """
        Lists the privileges assigned to user per a given operation
        """
        pass

    # pull data from DB
    def query(self, queries: list) -> list:
        """
        Querys entities based on a dictionary of provided filters
        returns list of dictionary types
        """
        # NOTE: NO indication for query on non-existent values.
        # Assume value exists and just returns an empty array.
        cmd = []
        values = []

        if len(queries) == 0:
            raise AttributeError(
                "### DBOperator: Cannot query an empty array...")

        for entity in queries:
            if len(entity) == 0:
                raise AttributeError(
                    "### DBOperator: Cannot query an empty dictionary...")
            conditions = []
            for attr, value in entity.items():
                conditions.append(f"{attr} = %s")
                values.append(value)

            if not conditions:
                return []

            cmd.append(f"""
                SELECT *
                FROM {self.table}
                WHERE {' AND '.join(conditions)}
            """)

        try:
            self.__cursor.execute(
                f"SELECT row_to_json(data) FROM ({' UNION '.join(cmd)}) data", tuple(values))
            results = [i[0] for i in self.__cursor.fetchall()]

            return results
        except Exception as e:
            print(f"### DBOperator: Error occured:\n{e}")

    def get_table(self) -> list:
        """
        Returns all entries in a table as a list of dictionary datatypes
        """
        self.__cursor.execute(
            f"select row_to_json(data) FROM (SELECT * FROM {self.table}) data")

        results = [i[0] for i in self.__cursor.fetchall()]

        return results

    def get_count(self) -> int:
        """
        Returns count of entries in table
        """
        # Idea is for this to be faster and more efficeint than pulling the whole table and counting it
        self.__cursor.execute(f"SELECT Count(*) FROM {self.table}")
        return self.__cursor.fetchone()[0]

if __name__ == "__main__":

    operator = DBOperator(db='project')  # For me :)

    # operator = DBOperator(db='project', host='localhost', port='5432',
    #                       user='postgres', passwd='1234', schema='public',
    #                       db='capstone')

    print(operator.permissions)
    print(operator.attrs)

    operator.close()
