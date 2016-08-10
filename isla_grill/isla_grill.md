You're still enjoying your Galapagos vacation! On the third night,
you and your family go to this cute restaurant called the IslaGrill.  After a delicious meal, your parents ask you to write a quick Ruby program to calculate potential tips for the waiter.  The total cost of the meal was $178.  They would like to know how much tip to give for 15%, 18%, 20%, and 25%.

You are given a 'tip' variable that has a random tip percentage in the form of an integer.  Use that tip
variable and flow control in order to calculate the proper tips.

Start with Ruby code below, which will supply the check's total and provide you with a random tip value:

```ruby
dinner_total = 178
tip = [15, 18, 20, 25].sample
```

Sample output (*with 15% randomly selected via the program*):

```no-highlight
You should tip $26.7
```

{% show_hint %}
- Make sure to use Floats when dealing with money
{% endshow_hint %}
