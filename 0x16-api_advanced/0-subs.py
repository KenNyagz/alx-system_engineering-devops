#!/usr/bin/python3
'''Returns the number of subscribers of a given subreddit'''
import requests


def number_of_subscribers(subreddit):
    '''Retrieves number of subscribers of a subreddit community'''
    if not subreddit or not isinstance(subreddit, str):
        return 0
    api_url = "https://www.reddit.com"
    endpoint = f"/r/{subreddit}/about.json"
    headers = {'User-agent': 'Mozilla/5.0'}

    url = api_url + endpoint
    resp = requests.get(url, headers=headersi, allow_redirects=False)

    if resp.status_code == 200:
        data = resp.json()
        # if not valid subreddit return 0 
        if 'data' not in data or 'subscribers' not in data['data']:
            return 0
        return data['data']['subscribers']
    else:
        return 0
