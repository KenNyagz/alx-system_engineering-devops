#!/usr/bin/python3
'''Uses a REST API to get an employee's todo list progress
'''
import requests
import sys


def get_employee_progress(employee_id):
    '''Get's an employees to-do list progress'''
    employee_url = f'https://jsonplaceholder.typicode.com/users/{employee_id}'
    response = requests.get(employee_url)
    if response.status_code != 200:
        print('Error loading data.')
        return

    employee_data = response.json()
    employee_name = employee_data.get('name')

    todo_list_url = f"https\
://jsonplaceholder.typicode.com/todos?userId={employee_id}"
    response = requests.get(todo_list_url)
    if response.status_code != 200:
        print("Error: TODO list not found")
        return

    todo_list = response.json()
    total_tasks = len(todo_list)
    done_tasks = [task for task in todo_list if task['completed']]
    num_done_tasks = len(done_tasks)
    print(f"Employee {employee_name} is done with tasks ({num_done_tasks}/{total_tasks}):")

    for task in done_tasks:
        print(f"\t {task['title']}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage:{} <employee_id>".format(sys.argv[0]))
    else:
        try:
            employee_id = int(sys.argv[1])
            get_employee_progress(employee_id)
        except ValueError:
            print("Error:ID not an integer")
