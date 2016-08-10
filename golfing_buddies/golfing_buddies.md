It's time to plan your first game of golf.
In order for it to be most enjoyable, you want to bring along your favorite golf friends to join you.
The problem is, you can't remember their email address. You know you have it lying around in a hash somewhere.
Oh, wait, here it is!

```ruby
golf_contacts = {
  jim: 'workerBee@example.com',
  samantha: 'golfCartRacer@example.com',
  jane: 'pro_golfer89@example.com',
  mike: 'alwaysAtTheBeach@example.com',
  olivia: 'didYouSeeWhereThatWent@example.com',
  joan: 'bestShortGameEver@example.com'
}
```

Use the `golf_contacts` hash to invite Samantha, Jane, and Olivia to your upcoming tee time via email.

Fill out the "To:" line of your email. In order to do so, you'll have to find the relevant email addresses,
and put all of the email addresses in a string separated by commas.

For extra bonus points, complete this challenge in one line (not including the hash assignment above).

Example Output:

```no-highlight
golfCartRacer@example.com,pro_golfer89@example.com,didYouSeeWhereThatWent@example.com
```

{% show_solution %}
```ruby
golf_contacts = {
  jim: 'workerBee@example.com',
  samantha: 'golfCartRacer@example.com',
  jane: 'pro_golfer89@example.com',
  mike: 'alwaysAtTheBeach@example.com',
  olivia: 'didYouSeeWhereThatWent@example.com',
  joan: 'bestShortGameEver@example.com'
}

puts [golf_contacts[:samantha], golf_contacts[:jane], golf_contacts[:olivia]].join(',')
```
{% endshow_solution %}
