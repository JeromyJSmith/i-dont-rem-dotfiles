#! /usr/bin/env python3
import random
import subprocess
import time
from engine import search_engine, num_searches
# find a way to pass SIGINT so we don't have to ctrl+c out of the "new window session" terminal logs
# Find a more efficient way than loading the whole file
def get_random_word():
  file = open("words.txt", "r")
  string = file.read()
  words = string.split("\n")
  return random.choice(words)

def open_new_window():
  subprocess.run(["google-chrome","--new-window", "https://google.com"])

def open_tab(query):
  subprocess.run(["google-chrome","--new-tab", search_engine + query])

#####################################################
# Search.py will take as input a url(usually a search engine you want to run a 
# query on) and adds a random word from the word list to it
#
# !Need string for search_engine and int for num_searches
open_new_window()
for i in range(num_searches):
  time.sleep(2)
  open_tab(get_random_word())

