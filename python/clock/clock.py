class Clock:

  def __init__(self, hour, minute):
    self.hour = hour % 24
    self.minute = minute
    self.time_format()

  def __str__(self):
    return self.time_format()
  
  def __eq__(self, other):
    return (self.hour == other.hour and self.minute == other.minute)

  def time_format(self):
    self.hour += self.minute // 60
    self.minute %= 60
    self.hour %= 24
    return str(self.hour).zfill(2) + ":" + str(self.minute).zfill(2)

  def add(self, minutes):
    self.minute += minutes
    return self.time_format()