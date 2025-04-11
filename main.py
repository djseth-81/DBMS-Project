# database orchestrator
from DBOperator import DBOperator
# shortcut to pretty-print our DB types
from pprint import pprint
# used for err, exit
import sys


def display_menu():
    """prints the main menu options."""
    print("\n----- School System Menu -----")
    print("1. Find Person by Name (SELECT)")
    print("2. Add New Course (INSERT)")
    print("3. Delete Enrollment Record (DELETE)")
    print("4. View a course's syllabus (JOIN)")
    print("5. SQL Console")
    print("0. Exit")
    print("-------------------------------")


def handle_select_person(operator: DBOperator, name_query=None):
    """handles option 1: select person by name."""
    if not operator.is_connected():
        print("error: cannot perform query, not connected to database.",
              file=sys.stderr)
        return
    try:
        if name_query is None:
            name_query = input("enter the start of the name to search for: ")
        # add an implicit wildcard if none is provided by the user
        if '%' not in name_query and '_' not in name_query:
            name_query += '%'
        conditions = {'name': name_query}
        results = operator.query(table='person', conditions=conditions)
        if results:
            print("found persons:")
            pprint(results, indent=2)
        else:
            print(f"no persons found matching name '{name_query}'.")
    except Exception as e:
        print(f"an error occurred during person query: {e}", file=sys.stderr)


def handle_insert_course(operator: DBOperator, code=None, title=None, credits_str=None, dept_id_str=None, description=None):
    """handles option 2: insert a new course."""
    if not operator.is_connected():
        print("error: cannot perform insert, not connected to database.",
              file=sys.stderr)
        return
    try:
        if code is None:
            print("enter new course details (course_id is auto-generated):")
            code = input("  course code (e.g. CS101): ")
            title = input("  course title: ")
            credits_str = input("  credits (integer > 0): ")
            dept_id_str = input("  department id (integer): ")
            description = input(
                "  description (optional, press enter to skip): ") or None

        # basic validation and type conversion
        if not code or not title:
            print("error: course code and title cannot be empty.", file=sys.stderr)
            return
        try:
            credits = int(credits_str)
            if credits <= 0:
                raise ValueError("credits must be positive.")
        except ValueError:
            print(
                "error: invalid input for credits. must be a positive integer.", file=sys.stderr)
            return
        try:
            department_id = int(dept_id_str)
        except ValueError:
            print(
                "error: invalid input for department id. must be an integer.", file=sys.stderr)
            return

        new_course_data = {
            'code': code,
            'title': title,
            'credits': credits,
            'department_id': department_id,
            'description': description
        }

        inserted_id = operator.add(table='course', entity=new_course_data)
        if inserted_id is not None:
            operator.commit()
            print(f"successfully added new course with course_id: {
                  inserted_id}.")
        else:
            print(
                "failed to add the new course. check previous errors. transaction rolled back.")

    except Exception as e:
        print(f"an error occurred during course insertion: {
              e}", file=sys.stderr)
        operator.rollback()


def handle_delete_enrollment(operator: DBOperator, student_id_str=None, course_id_str=None, section=None, semester=None, year_str=None):
    """handles option 3: delete an enrollment record."""
    if not operator.is_connected():
        print("error: cannot perform delete, not connected to database.",
              file=sys.stderr)
        return
    try:
        if student_id_str is None:
            print("enter details to identify the enrollment record to delete:")
            student_id_str = input("  student id: ")
            course_id_str = input("  course id: ")
            section = input("  section number: ")
            semester = input("  semester (e.g. Fall): ")
            year_str = input("  year (e.g. 2024): ")

        # basic validation and type conversion
        try:
            student_id = int(student_id_str)
            course_id = int(course_id_str)
            year = int(year_str)
        except ValueError:
            print(
                "error: student id, course id, and year must be integers.", file=sys.stderr)
            return
        if not section or not semester:
            print("error: section number and semester cannot be empty.",
                  file=sys.stderr)
            return

        conditions = {
            'student_id': student_id,
            'course_id': course_id,
            'section_number': section,
            'semester': semester,
            'year': year
        }

        # first, check if the record exists to provide better feedback
        existing = operator.query(table='enrollment', conditions=conditions)
        if not existing:
            print("no enrollment record found matching the provided details.")
            return

        # facilitate automatic testing
        if len(sys.argv) > 1 and sys.argv[1] == 'auto':
            confirm = 'yes'
        else:
            confirm = input(f"found enrollment record(s): {
                            existing}\nconfirm deletion? (yes/no): ").lower()

        if confirm == 'yes':
            deleted = operator.delete(
                table='enrollment', conditions=conditions)
            if deleted:
                operator.commit()
                print("enrollment record deleted successfully.")
            else:
                print(
                    "failed to delete the enrollment record. check previous errors. transaction rolled back.")
        else:
            print("deletion cancelled.")

    except Exception as e:
        print(f"an error occurred during enrollment deletion: {
              e}", file=sys.stderr)
        operator.rollback()


def handle_sql_console(operator: DBOperator):
    """handles option 5: execute raw sql commands."""
    if not operator.is_connected():
        print("error: cannot open console, not connected to database.", file=sys.stderr)
        return

    print("\n--- SQL Console ---")
    print("enter sql commands directly. type 'exit' or 'quit' to return to the main menu.")

    while True:
        try:
            sql = input("sql> ").strip()
            if not sql:
                continue
            if sql.lower() in ['exit', 'quit']:
                break

            result = operator.execute_raw_sql(sql)

            if result is not None:
                if isinstance(result, list):
                    if result:
                        print("query results:")
                        pprint(result, indent=2)
                    else:
                        print("query executed successfully, but returned no results.")
                elif isinstance(result, int):
                    # operator is verbose enough here, no need to print anything
                    pass

        except (EOFError, KeyboardInterrupt):
            print("\nreturning to main menu.")
            break
        except Exception as e:
            print(f"an error occurred in sql console: {e}", file=sys.stderr)

    print("-----------------------")


def handle_course_syllabus(operator: DBOperator, course_code=None, year=None):
    """handles option 4: Display assignments for a course with respect to a given year"""

    if not operator.is_connected():
        print("error: cannot perform delete, not connected to database.",
              file=sys.stderr)
        return

    if course_code is None:
        course_code = input("Enter course code: ")

    if year is None:
        year = input("Enter year course was offered: ")

    try:
        year = int(year)
    except ValueError:
        print("error: invalid input for year. Must be an integer.", file=sys.stderr)

    try:
        # first, check if the record exists to provide better feedback
        existing = operator.query(
            table='course', conditions={'code': course_code})

        if not existing:
            print(f"{course_code} is not offered.")
            return

        command = f"""
        select c.code, a.title, a.max_points, a.weight, due_date
        from assignment a
        join course c on a.course_id = c.course_id
        where c.code like '{course_code}'
        AND a.year = {int(year)}
        """
        results = operator.execute_raw_sql(sql=command)
        # If elements in result from the JOIN, no assignments were found for
        # the course in a given year
        if len(results) > 0:
            print(f"Syllabus for {course_code} in {year}:")
            pprint(results, indent=2)
        else:
            print(f"no syllabus available for {
                  course_code} in the year {year}.")

    except Exception as e:
        print(f"an error occurred searching for course: {e}", file=sys.stderr)


if __name__ == "__main__":
    # specify the database file
    # TODO: support a custom database filename
    db_file = 'project.db'
    # create an instance of the database operator
    operator = DBOperator(db_file=db_file)

    # check if the connection was successful before showing the menu
    if operator.is_connected():
        # facilitate automatic testing by prefilling all inputs
        if len(sys.argv) > 1 and sys.argv[1] == 'auto':
            with open('test_output.txt', 'w') as f:
                sys.stdout = f
                handle_select_person(operator, name_query="John%")
                handle_insert_course(operator, code="CS102", title="Intro to CS",
                                     credits_str="3", dept_id_str="1", description="Basic CS course")
                handle_delete_enrollment(
                    operator, student_id_str="11", course_id_str="6", section="A", semester="Spring", year_str="2024")
                sys.stdout = sys.__stdout__
            print("auto mode completed. output saved to test_output.txt.")
        else:
            while True:
                display_menu()
                choice = input("enter your choice (1-5, 0 to Exit): ")

                if choice == '1':
                    handle_select_person(operator)
                elif choice == '2':
                    handle_insert_course(operator)
                elif choice == '3':
                    handle_delete_enrollment(operator)
                elif choice == '4':
                    handle_course_syllabus(operator)
                elif choice == '5':
                    handle_sql_console(operator)
                elif choice == '0':
                    print("exiting program.")
                    break
                else:
                    print("invalid choice. please enter a number between 1 and 5.")

        operator.close()
    else:
        print(f"fatal: could not establish initial connection to database '{
              db_file}'. exiting.", file=sys.stderr)
        sys.exit(1)
