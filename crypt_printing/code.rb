crypt_of_civilization = [
  "Comptometer",
  "box of phonographic records",
  "plastic savings bank",
  "set of scales",
  "Toast-O-Lator",
  "sample of aluminum foil",
  "A Donald Duck doll",
  "container of beer",
  "Lionel model train set",
  "Ingraham pocket watch"
]

count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end

crypt_of_civilization.each do |x|
  puts x
end
