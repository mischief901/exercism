## create list from 2..max_number
## iterate thru list and remove all numbers that are divisible by the current element.
## repeat until all values up to the max_number have been checked.

def sieve(max_num):
  primes = [x for x in range(2, max_num+1)]
  
  for num in primes:
    check = primes[ primes.index(num) + 1 : len(primes)]
    for i in check:
      if i % num == 0:
        primes.remove(i)
  
  return primes
