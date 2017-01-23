def square_of_sum(num):
  sums = sum(range(1, num + 1))
  return sums ** 2

def sum_of_squares(num):
  list_of_squares = [x**2 for x in range(1, num + 1)]
  return sum(list_of_squares)

def difference(num):
  return square_of_sum(num) - sum_of_squares(num)