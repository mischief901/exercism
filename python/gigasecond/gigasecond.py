from datetime import timedelta

def add_gigasecond(datetime):
  gigasecond = 1000000000

  new = timedelta(seconds = gigasecond)
  return datetime + new