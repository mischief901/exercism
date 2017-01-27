import re

def encode(phrase):
  phrase = re.sub("[^a-zA-Z\d]", "", phrase).lower()

  encoded = []
  for i in range(len(phrase)):
    letter = phrase[i]
    if phrase[i].isalpha():
      letter = chr(25 - ord(letter) + 2*97)
    if i % 5 == 4:
      letter += " "
    encoded.append(letter)
  return "".join(encoded).rstrip()

def decode(phrase):
  phrase = re.sub("[^a-zA-Z\d]", "", phrase).lower()

  decoded = []
  for letter in phrase:
    if letter.isalpha():
      letter = chr(25 - ord(letter) + 2*97)
    decoded.append(letter)
  return "".join(decoded)