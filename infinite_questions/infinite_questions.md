Time to get some customers some snacks! Write an infinite loop that asks your
customer if you can get him/her anything, and then accepts their input. If
they typed anything other than "no", the loop should run again! After the
loop ends, say goodbye.

###Example Output

```
Can I get you anything?
> A soda, please
Can I get you anything?
> Nah, that's okay.
Can I get you anything?
> Shut up you stupid machine
Can I get you anything?
> oh god this will never end will it...
Can I get you anything?
> no
Okay, bye!
```

{% show_solution %}
```ruby
while true do
  puts "Can I get you anything?"
  answer = gets.chomp
  if answer == "no"
    puts "Okay, bye!"
    break
  end
end
```
{% endshow_solution %}
