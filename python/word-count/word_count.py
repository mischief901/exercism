import re

def word_count(text):
  word_list = re.split("[\W\_\n\t]+", text.lower())

  word_counts = {}
  for word in word_list:
    if word != "":
      word_counts[word] = word_list.count(word)

  return word_counts