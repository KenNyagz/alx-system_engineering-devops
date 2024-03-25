#!/usr/bin/python3
'''export data in the CSV format 
'''
import requests
import sys
import csv


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

    filename = f"{employee_id}.csv"

    with open(filename, mode='w', newline='') as fle:
        writer = csv.writer(fle)
        writer.writerow(["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS", "TASK_TITLE"])
    #total_tasks = len(todo_list)
    #done_tasks = [task for task in todo_list if task['completed']]
    #num_done_tasks = len(done_tasks)
    #print(f"Employee {employee_name} is done with tasks\
#({num_done_tasks}/{total_tasks}):")

        for task in todo_list:
            writer.writerow([employee_id, employee_name, task['completed'], task['title']])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage:{} <employee_id>".format(sys.argv[0]))
    else:
        try:
            employee_id = int(sys.argv[1])
            get_employee_progress(employee_id)
        except ValueError:
            print("Error:ID not an integer")
