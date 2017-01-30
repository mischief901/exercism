# get first letters and capital letters without surrounding capital letters.

from re import findall

def abbreviate(string):
  letters = findall(r"(?<![A-Z])[A-Z]|(?<=[\s\-])[a-z]", string)
  return "".join(letters).upper()