def distance(string1, string2):
  if len(string1) != len(string2):
    raise ValueError
  
  sequence1 = list(string1)
  sequence2 = list(string2)

  count = 0
  for i in range(len(string1)):
    if sequence1[i] != sequence2[i]:
      count += 1
  
  return count