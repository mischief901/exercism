import string
import re

def is_pangram(text):
  alpha_set = set(string.ascii_lowercase)
  text_set = set(re.findall('[a-z]', text.lower()))
  return text_set == alpha_set