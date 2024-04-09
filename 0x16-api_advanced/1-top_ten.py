#!/usr/bin/python3
'''queries the Reddit API and prints the titles of the first 10 hot
posts listed for a given subreddit'''
import requests


def top_ten(subreddit):
    '''Gets top ten hot posts from a subreddit'''
    uri = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"

    headers = {'User-agent': 'Myself'}

    resp = requests.get(uri, headers=headers, allow_redirects=False)
    if resp.status_code == 200:
        data = resp.json()
        titles = [post['data']['title'] for post in data['data']['children']]

        for title in titles:
            if not title.startswith("[META]"):
                print("{}".format(title))
    else:
        print("None")


if __name__ == '__main__':
    from sys import argv
    if len(argv) == 2:
        top_ten(argv[1])
    else:
        print("Provide one subreddit")
