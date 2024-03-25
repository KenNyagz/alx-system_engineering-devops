#!/usr/bin/python3
'''Python script to export data in the JSON format
'''
import requests
import sys
import json


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

    formatted_data = {"USER_ID": [{"task": task["title"],\
                                  "completed": task["completed"],\
                                  "username": employee_name}\
                                  for task in todo_list
                                 ]
                     }
    filename = f"{employee_id}.json"
    with open(filename, mode='w') as fyle:
        json.dump(formatted_data, fyle, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage:{} <employee_id>".format(sys.argv[0]))
    else:
        try:
            employee_id = int(sys.argv[1])
            get_employee_progress(employee_id)
        except ValueError:
            print("Error:ID not an integer")
