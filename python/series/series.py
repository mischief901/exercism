import re

def slices(num_string, num):

    if len(num_string) < num or num == 0:
      raise ValueError

    num_list = re.findall('\d', num_string)
    num_list = [ int(x) for x in num_list ]
   
    num_slices = []

    for i in range(len(num_list) - num + 1):
      mini_slice = []
      for j in range(num):
        mini_slice.append(num_list[i + j])
      num_slices.append(mini_slice)
    return num_slices

