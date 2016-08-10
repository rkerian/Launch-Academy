### Part I - A List of Movies

Now that we have all of that pizza business sorted, let's catch a movie!

In order to pick the awesomely 80's movie that you want to see, you really need to break down
each movie into a Ruby instance. Here's the list of movies playing at the local
theatre tonight:

```no-highlight
The Princess Bride, Comedy, 7:00PM
Troll 2, Horror, 7:30PM
Pet Cemetery, Horror, 8:15PM
Flight of the Navigator, Adventure, 8:17PM
Teen Witch, Comedy, 8:20PM
The Goonies, Comedy, 8:30PM
Better Off Dead, Comedy, 8:45PM
Weekend at Bernies, Comedy, 9:00PM
The Wizard, Adventure, 9:10PM
```

Create an array of instances to represent this list of movies. Ensure that each
instance provides us with a way to access the title, genre, and start time of the
movie. Use `Time.parse` ([docs here](http://ruby-doc.org/stdlib-2.1.1/libdoc/time/rdoc/Time.html#method-c-parse)) in the contructor to ensure you're working with the
right data structure for the movie's start time.

### Part II

Implement a `showing_after?` instance method that takes a single, string
argument that represents the time you'll arrive at the theatre. This
method should return `true` if the start time begins on or after the specified
time. Again, you'll want to use `Time.parse` to be working with the right data
type.

Also, we really like comedies. Implement a `comedy?` instance method that
returns `true` if the movie has the genre `Comedy`, but returns false otherwise.

### Part III

Implement a `showing_between?` instance method that takes two string arguments
that represents desirable times for when the movie begins. It should return
`true` if the movie's start time fits between the two specified times.

{% show_solution %}
```ruby
require 'time'

class Movie
  attr_accessor :name, :genre, :start_time

  def initialize(row_hash)
    @name = row_hash[:name]
    @genre = row_hash[:genre]
    @start_time = Time.parse(row_hash[:start_time].strip)
  end

  def showing_after?(arrival_time)
    @start_time >= Time.parse(arrival_time)
  end

  def showing_between?(early_time, late_time)
    @start_time.between?(Time.parse(early_time), Time.parse(late_time))
  end

  def comedy?
    @genre == 'Comedy'
  end

  def to_s
    "#{@name} is a #{@genre} film and starts at #{@start_time.strftime("%-l:%M %p")}"
  end
end
```
{% endshow_solution %}
