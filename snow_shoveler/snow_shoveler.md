You have a snow shoveling business and decide to write a program to help
you build quotes for clients.  

In order to test your new program, the first quote you build will be for your
neighbor. You charge clients by the cubic foot of snow. The driveway of your neighbor's house
is 8 ft wide and 20 ft long. The last snowstorm dropped 8 inches of snow in total.  

Here is your initial pricing chart:  

```no-highlight
0 - 50 cubic ft:  $20  
51 - 150 cubic ft: $50  
150 - 300 cubic ft: $100  
300+ cubic ft: $150  
```

Write a program that displays how many cubic ft of snow dropped
in a driveway and how much it will cost the clients for you to
clear out the snow.  

{% show_hint %}
  - cubic ft is measured: side X side X side  
  - when converting inches to ft make sure to use Floats  
{% endshow_hint %}

Example Ouput:  

```no-highlight
Cubic Feet: 106.66666666666666  
Quote Price: $50  
```

{% show_hint %}
* You will need to utilize a complex `if` / `else` statement to set the appropriate price after the cubic feet is calculated.
{% endshow_hint %}


{% show_solution %}
```ruby
width = 8.0 # feet
length = 20.0 # feet
height = 8.0 / 12.0 # inches converted to feet

cubic_feet = width * length * height

if cubic_feet < 50
  price = 20
elsif cubic_feet < 150
  price = 50
elsif cubic_feet < 300
  price = 100
else
  price = 150
end

puts "Cubic Feet: #{cubic_feet}"
puts "Quote Price: $#{price}"
```
{% endshow_solution %}

###Video Solution

{% vimeo_video "124954508" %}
