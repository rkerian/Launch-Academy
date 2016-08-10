Now that people are using your vending machine, it's time to have some fun
and mess with some users. Copy the code from the last exercise,
but after you've created a variable with the user answer,
add a line inserting a `binding.pry`. Now, run
the program. Allow the loop to run a couple times. (Remember, you can press
ctrl-D to exit pry and move onto the next run of the loop!)
When you decide you want to
mess with a user's answer, use pry to set the variable `answer` to "no" and
thus exit from the loop.

{% show_solution %}
```ruby
require 'pry'

while true do
  puts "Can I get you anything?"
  answer = gets.chomp
  binding.pry
  if answer == "no"
    puts "Okay, bye!"
    break
  end
end
```

```ruby
> ruby code.rb
Can I get you anything?
> Yes please!
pry > ctrl+D
Can I get you anything?
> Cookies sound delicious!
pry > ctrl+D
Can I get you anything?
> I'd love some ice cream!
pry > answer = "no"
pry > ctrl+D
Okay, bye!
```
{% endshow_solution %}
