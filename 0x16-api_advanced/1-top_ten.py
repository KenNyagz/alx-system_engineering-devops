#!/usr/bin/python3
'''queries the Reddit API and prints the titles of the first 10 hot
posts listed for a given subreddit'''
import requests


def top_ten(subreddit):
    '''Gets top ten hot posts from a subreddit'''
    uri = f"https://www.reddit.com/r/{subreddit}/hot.json"

    headers = {'User-agent': 'Myself'}

    resp = requests.get(uri, headers=headers, params={'limit': 10})
    if resp.status_code == 200:
        data = resp.json()
        titles = [post['data']['title'] for post in data['data']['children']]

        for title in titles:
            print("{}".format(title))
    else:
        print("None")
