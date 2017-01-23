import string

def to_rna(sequence):
  pairs = list(sequence)
  rna = []
  for pair in pairs:
    rna.append(convert(pair))
  rna_sequence = "".join(rna)
  if len(rna_sequence) == len(sequence):
    return rna_sequence
  return ""

def convert(pair):
  if pair == "C":
    return "G"
  elif pair == "G":
    return "C"
  elif pair == "A":
    return "U"
  elif pair == "T":
    return "A"
  else:
    return ""
