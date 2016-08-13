names = ["Ryan", "Micah", "Yolanda"]


# def check_names(names)
#   names.each do |name|
#     puts true if name.start_with?("Y")
#   end
# end
#
# # answer = check_names(names)
# # puts answer
# check_names(names)

found = false
names.each do |name|
  if name.start_with?("S")
    found = true
  end
end
puts found
