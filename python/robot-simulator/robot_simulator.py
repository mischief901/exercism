
NORTH = (0, 1)
SOUTH = (0, -1)
WEST = (-1, 0)
EAST = (1, 0)

left = {
  NORTH : WEST,
  SOUTH : EAST,
  EAST  : NORTH,
  WEST  : SOUTH
}

right = {
  NORTH : EAST,
  SOUTH : WEST,
  EAST  : SOUTH,
  WEST  : NORTH
}


class Robot:

  def __init__(self, direction=NORTH, pos_x=0, pos_y=0):
    self.coordinates = (pos_x, pos_y)
    self.bearing = direction

  def turn_right(self):
    self.bearing = right[self.bearing]

  def turn_left(self):
    self.bearing = left[self.bearing]

  def advance(self):
    dx, dy = self.bearing
    x, y = self.coordinates
    self.coordinates = (x + dx, y + dy)

  def simulate(self, moves):
    for move in moves:
      if move == "A":
        self.advance()
      if move == "R":
        self.turn_right()
      if move == "L":
        self.turn_left()