import functools

def sum_of_multiples(n, list_of_multiples):

  all_nums = [x for x in range(n)]
  all_multiples = []

  for multiple in list_of_multiples:
    for x in all_nums:
      try:
        if x % multiple == 0 and x not in all_multiples:
          all_multiples.append(x)
      except:
        pass

  return functools.reduce(lambda x, y: x + y, all_multiples, 0)