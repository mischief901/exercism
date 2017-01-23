import datetime
import calendar

def meetup_day(year, month, day_of_week, selection):

  if selection == '1st':
    day_range = range(1, 8)
  elif selection == '2nd':
    day_range = range(8, 15)
  elif selection == 'teenth':
    day_range = range(13, 20)
  elif selection == '3rd':
    day_range = range(15, 22)
  elif selection == '4th':
    day_range = range(22, 30)
  elif selection == 'last':
    if month == 2:
      if calendar.isleap(year):
        day_range = range(23, 30)
      else:
        day_range = range(22, 29)
    elif month == 3 | 4 | 6 | 9 :
      day_range = range(24, 31)
    else:
      day_range = range(25, 32)
  elif selection == '5th':
    day_range = range(30, 31)
  else:
    raise Exception
  

  for day in day_range:
    date = datetime.date(year, month, day)

    if day_of_week == "Monday" and date.weekday() == 0:
      return date
    elif day_of_week == "Tuesday" and date.weekday() == 1:
      return date
    elif day_of_week == "Wednesday" and date.weekday() == 2:
      return date
    elif day_of_week == "Thursday" and date.weekday() == 3:
      return date
    elif day_of_week == "Friday" and date.weekday() == 4:
      return date
    elif day_of_week == "Saturday" and date.weekday() == 5:
      return date
    elif day_of_week == "Sunday" and date.weekday() == 6:
      return date

  raise Exception
  

