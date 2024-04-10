#!/bin/python3

import requests

headers = { "DD-API-KEY": '<>',
            "DD-APPLICATION-KEY": '<>'
}
resp = requests.get("https://api.datadoghq.com/api/v1/dashboard", headers=headers)
data = resp.json()

for dashboard in data['dashboards']:
        print("Dashboard Title:", dashboard['title'])
        print("Dashboard ID:", dashboard['id'])

print(data)
