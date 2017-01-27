class Allergies:

  def __init__(self, score):
    self.lst = []
    self.allergic(score)

  def allergic(self, score):
    if score >= 256:
      score -= 256
    if score >= 128:
      score -= 128
      self.lst.append("cats")
    if score >= 64:
      score -= 64
      self.lst.append("pollen")
    if score >= 32:
      score -= 32
      self.lst.append("chocolate")
    if score >= 16:
      score -= 16
      self.lst.append("tomatoes")
    if score >= 8:
      score -= 8
      self.lst.append("strawberries")
    if score >= 4:
      score -= 4
      self.lst.append("shellfish")
    if score >= 2:
      score -= 2
      self.lst.append("peanuts")
    if score != 0:
      self.lst.append("eggs")
      

  def is_allergic_to(self, item):
    return item in self.lst