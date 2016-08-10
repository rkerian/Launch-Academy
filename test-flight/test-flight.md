### Learning Goals

* Get familiar with writing and organizing RSpec tests
* Refactor tests using the `let` keyword

### Instructions

Test-drive the implementation of an `Airplane` class in the *lib/airplane.rb* file.

####Part One: Create an Airplane

To create an airplane you need to specify the type, [wing loading](http://en.wikipedia.org/wiki/Wing_loading), and horsepower:

```ruby
my_plane = Airplane.new("cesna", 10, 150)
```

Write tests in the *spec/lib/airplane_spec.rb* file to ensure that you can access each of these attributes after creating an airplane object. For example, you may have a test in the `describe "#initialization"` block that reads back the `type` after creating the object:

```ruby
my_plane = Airplane.new("cesna", 10, 150)
expect(my_plane.type).to eq("cesna")
```

To run the test suite use the `rspec` command within the project directory:

```no-highlight
$ rspec
...

Finished in 0.00069 seconds (files took 0.10908 seconds to load)
3 examples, 0 failures
```

*If the `rspec` command is not available, install it via `gem install rspec`.*

####Part Two: Make the Airplane do things
Once you have passing tests for the three attributes, write tests and implement the following methods for things that an instance of an Airplane can do:

* The `start` method should turn on the engine if it is not already running. It should return whether the engine was just started or if it has already been running:

```ruby
my_plane.start
#=> "airplane started"

# OR if the plane was already started

my_plane.start
#=> "airplane already started"
```

* The `takeoff` method should change the state of the plane to flying. The plane can only take off if the engine is already running. It should return whether the plane has taken off or not:

```ruby
my_plane.takeoff
#=> "airplane not started, please start"

# OR if the plane was already started

my_plane.start
my_plane.takeoff
#=> "airplane launched"
```

* The `land` method should change the state of the plane to landed. The plane can only land if it is currently flying. It should return whether the plane successfully landed or not (or whether it needs to be started):

```ruby
my_plane.land
#=> "airplane not started, please start"

# OR if the plane has been started but hasn't taken off

my_plane.start
my_plane.land
#=> "airplane already on the ground"

# OR if the plane is already in the air

my_plane.start
my_plane.takeoff
my_plane.land
#=> "airplane landed"
```

### Part Three: Keep track of the Airplane's fuel status

Add a `fuel` internal attribute to your airplane that is set at initialization. Write tests for scenarios where the plane does not have enough fuel to complete the above actions.

Each of the `start`, `takeoff`, and `land` methods should use up some amount of fuel every time they are called. If any of the methods cannot be completed due to a lack of fuel, they should return a different status message. If necessary, add an additional method for checking the fuel level of the plane to make writing the tests easier.

### Extra Challenge: Refactoring Tests

At this point your test file should be getting fairly large and probably contains duplicate steps to setup each test. Remove some of the duplication by using the [`let` syntax in RSpec](https://relishapp.com/rspec/rspec-core/v/3-2/docs/helper-methods/let-and-let) to lazily initialize the airplane when it is needed.
