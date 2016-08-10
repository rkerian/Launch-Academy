require 'pry'
crypt_of_civilization = [
  "Comptometer",
  "box of phonographic records",
  "plastic savings bank",
  "set of scales",
  "Toast-O-Lator",
  "sample of aluminum foil",
  "A Donald Duck doll"
]
extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = crypt_of_civilization + extra

# How many items are in the array?
puts crypt_of_civilization.count

# What is the first item in the array?
puts crypt_of_civilization[0]
# What is the last item in the array?
puts crypt_of_civilization[-1]
# What is the second item in the array?
puts crypt_of_civilization[1]
# What is the third item in the array?
puts crypt_of_civilization[2]
# What is the second from last item in the array?
puts crypt_of_civilization[-2]
# What is the index of "Toast-O-Lator"?
puts crypt_of_civilization.index('Toast-O-Lator')
binding.pry
