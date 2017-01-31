from functools import reduce

def largest_product(number_string, nums):
  length = len(number_string) - nums + 1
  if length <= 0 or nums < 0:
    raise ValueError
  if nums == 0:
    return 1

  products = []

  for i in range(length):
    sub_string = number_string[i:i+nums]

    int_list = [int(x) for x in sub_string]
    product = reduce(lambda x, acc: x*acc, int_list)
    products.append(product)

  return max(products)
  
