def detect_anagrams(word, anagram_list):
  
  potential = []
  final = []

  for anagram in anagram_list:
    if word.lower() != anagram.lower() and len(word) == len(anagram):
      potential.append(anagram)
  for anagram in potential:
    for i in range(len(word)):
      letter = word.lower()[i]
      if word.lower().count(letter) != anagram.lower().count(letter):
        break
      elif i == len(word)-1:
        final.append(anagram)
  return final
