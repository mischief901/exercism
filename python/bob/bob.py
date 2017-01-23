#
# Skeleton file for the Python "Bob" exercise.
#

import re

def hey(what):
  what = re.sub("[\s\t]", "", what)

  if what == "":
    return "Fine. Be that way!"
  elif what.upper() == what and what.lower() != what :
    return "Whoa, chill out!"
  elif what[-1] == "?":
    return "Sure."
  return "Whatever."
