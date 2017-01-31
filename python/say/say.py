
one_digits = {
  0: '',
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine'
}
two_digits = {
  0: '',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
  20: 'twenty',
  30: 'thirty',
  40: 'forty',
  50: 'fifty',
  60: 'sixty',
  70: 'seventy',
  80: 'eighty',
  90: 'ninety'
}
place = {
  0: '',
  1: ' thousand ',
  2: ' million ',
  3: ' billion '
}

def get_hundreds_digits(digit):
  punc = "-"
  hundred = " hundred and "
  if digit > 0:
    ones = digit % 10
    if 10 < digit%100 < 19:
      ones = 0
    digit -= ones
    tens = digit % 100
    digit -= tens
    hundreds = digit / 100
    if tens == 0 or ones == 0:
      punc = ""
    if hundreds == 0:
      hundred = ""
    if tens == 0 and ones == 0:
      hundred = " hundred"
    return one_digits[hundreds] + hundred + two_digits[tens] + punc + one_digits[ones]
  return ""

def say(number):
  incremental = []
  if number < 0 or number >= 1e12:
    raise AttributeError
  if number == 0:
    return 'zero'

  every_thousand = []
  decs = [1000000000, 1000000, 1000, 1]
  for thousand in decs:
    if thousand <= number:
      every_thousand.append(number // thousand)
      number %= thousand
    else:
      every_thousand.append(0)
  every_thousand.reverse()
  number = ""

  for i in range(len(every_thousand)):
    digit = int(every_thousand[i])
    words = get_hundreds_digits(digit)

    if words != "":
      if "and" not in number and number != "" :
        number = "and " + number
      number = words + place[i] + number

  return number.rstrip()