#!/usr/bin/python3
'''Recursively queries reddit api returning a list of all hot articles of a
subreddit'''
import requests


def recurse(subreddit, hot_list=[], after=None):
    '''return a list of all hot articless of a subreddit'''
    # set base  case
    if hot_list is None:
        hot_list = []

    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': "Must"}
    params = {'limit': 80, 'after': after}

    resp = requests.get(url, headers=headers, params=params)
    if resp.status_code == 200:
        data = resp.json()
        posts = data['data']['children']
        if not posts:
            return None
        for post in posts:
            hot_list.append(post['data']['title'])

        after = data['data'].get('after')
        if after:
            recurse(subreddit, hot_list, after)
        else:
            return hot_list
    else:
        return None
