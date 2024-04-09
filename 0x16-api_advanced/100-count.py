#!/usr/bin/python3
'''Recursively retrieves a subreddit's hot articles,
prints sorted count of given keywords(case-insensitive, delimited by spaces)'''
from collections import Counter
import requests


def count_words(subreddit, word_list, after=None, counts=None):
    '''recursively queries reddit api for hot articles and
            sorts the titles by count. printing count'''
    if counts is None:
        counts = Counter()

    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-agent': "Brave browser"}
    params = {'limit': 100, 'after': after}

    resp = requests.get(url, headers=headers, params=params)
    if resp.status_code == 200:
        data = resp.json()
        posts = data['data']['children']
        if not posts:
            return None
        for post in posts:
            title = post['data']['title']
            # Split title into words and count occurrences of each word
            title_words = title.lower().split()
            for word in word_list:
                if word.lower() in title_words:
                    counts[word.lower()] += 1

        after = data['data'].get('after')
        if after:
            count_words(subreddit, word_list, after, counts)
        else:
            sorted_counts = sorted(counts.items(), key=lambda x: (-x[1], x[0]))
            for word, count in sorted_counts:
                print(f"{word}: {count}")
    else:
        pass
