Using a `while` loop, print out each element of the array `crypt_of_civilization`.
Do the same with an `each` loop!

{% show_solution %}
```ruby
count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end

crypt_of_civilization.each do |item|
  puts item
end
```
{% endshow_solution %}
