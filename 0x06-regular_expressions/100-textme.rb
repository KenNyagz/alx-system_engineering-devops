#!/usr/bin/env ruby
input = ARGV[0]
pattern = /\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/

matches = input.match(pattern)

sender = matches[1]
receiver = matches[2]
flags = matches[3]

puts"#{sender},#{receiver},#{flags}"
