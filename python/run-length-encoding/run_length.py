import re

def encode(text):
  text_list = list(text)
  count = 1
  encoded = []
  for element in range(len(text_list)-1):
    if element < len(text_list)-1 and text_list[element] == text_list[element + 1]:
      count += 1
    else:
      if count != 1:
        encoded.append(str(count))
      encoded.append(text_list[element])
      count = 1
  if count != 1:
    encoded.append(str(count))
  encoded.append(text_list[-1])

  return "".join(encoded)

def decode(text):

  encoded_list = re.findall('(\d*)(.)', text)
  decoded = []

  for (x, y) in encoded_list:
    if x == '':
      decoded.append(y)
    else:
      decoded.append(int(x) * y)
  
  return "".join(decoded)