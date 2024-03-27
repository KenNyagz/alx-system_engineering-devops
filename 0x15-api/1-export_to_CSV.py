#!/usr/bin/python3
'''Saving data collected and filtered from api to csv file'''
import csv
import requests
import sys


userID = sys.argv[1]

api = 'https://jsonplaceholder.typicode.com/'

user_url = api + 'users/' + userID
resp = requests.get(user_url)
user_data = resp.json()
username = user_data['username']

todo_url = api + 'todos?userId=' + userID
response = requests.get(todo_url)

tasks = response.json()

filename = f'{userID}.csv'
with open(filename, 'w') as f:
    writer = csv.writer(f, quoting=csv.QUOTE_ALL)
    for task in tasks:
        writer.writerow([userID, username, task['completed'], task['title']])
