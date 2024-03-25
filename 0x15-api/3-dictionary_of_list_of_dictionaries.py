#!/usr/bin/python3
'''export data in the JSON format
'''
import json
import requests


if __name__ == "__main__":
    users_url = "https://jsonplaceholder.typicode.com/users"
    users_results = requests.get(users_url).json()

    temp_dict = {}
    for user in users_results:
        todo_list = []

        const_url = "https://jsonplaceholder.typicode.com"
        todos_url = const_url + '/user/{}/todos'.format(user.get("id"))
        names_url = "https://jsonplaceholder.typicode.com/user/{}".format(
                user.get("id"))

        todo_result = requests.get(todos_url).json()
        name_result = requests.get(names_url).json()
        for todo in todo_result:
            todo_dict = {}
            todo_dict.update({"username": name_result.get("username"),
                              "task":todo.get("title"),
                              "completed": todo.get("completed")})
            todo_list.append(todo_dict)

            temp_dict.update({user.get("id"): todo_list})
            with open("todo_all_employees.json", 'w') as f:
                json.dump(temp_dict, f)
