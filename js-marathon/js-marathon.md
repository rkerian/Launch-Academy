# The Final Frontier

It's time to explore space! But first, we've got to work together and build a spaceship that will get us there!

We've provided a `shipyard.js` file that we're going to use to build our ship, our rockets, our crew, and blast off.

#### Step 0 - Create a launchpad

We need a launchpad from which we can launch our spaceship!

Create a function called `launchpad`.
Inside of the function write a short message announcing the initiation of preflight procedures - any string of text that you and your group agree on!
This message should be outputted to the browser's developer tools console.

Then call `launchpad` at the end of the file.
We can run the code by going to the terminal and typing `node shipyard.js`.
You should see your preflight message!

After each step, we should run `node shipyard.js` to make sure our code works, and is printing what we expect.

#### Step 1 - Build a spaceship!

Let's start building our space vessel!

Create a Javascript object and name it `ship`, and then give it a `name` property.
Discuss with your group what an appropriate name for this ship might be.

Let's add another preflight message that announces the name of our ship in our `launchpad` function.
We'll need to add an argument to the `launchpad` function so we can pass in the `ship`.

#### Step 2 - Round up your crew!

We're going to work on getting our crew on the ship - but first we need to round them up!

First create an array named `crewNames`, and fill it with the name of all the members in your mentor group!

We're going to create a function called `trainCrew` that takes in an array of strings (the names of each crew member) and returns an array of Javascript objects (a crewMember object).
Each of these objects has a `name` property whose corresponding value is the name of a crew member!

Finish by creating an array of crew member objects called `crewMembers` by using both the `crewNames` array and the `trainCrew` function.

#### Step 3 - Board the ship!

Time to get our crew onboard the ship!

Let's add a `crew` property to the ship with a default value of an empty array.

Next, let's create a `loadCrew` property on the ship with an anonymous function as a value.
This anonymous function should take in an array of crew member objects and one by one it should:
  * Add them to the ship's `crew` array.
  * Output a message announcing the name of the crew member that has boarded the ship.

Let's make loading the crew part of the `launchpad` function. We're going to add another argument to `launchpad` to accept the `crewMembers` array.
Finally, lets call the ship's `loadCrew` function with the `crewMembers` array in the `launchpad` function.

#### Step 4 - Name a captain!

The crew decided to take turns playing the role of captain of the ship. Every time we ask the ship who is the captain, we're going to get a random crewmate!

Start by defining the `captain` function on the `ship` object.
This function will randomly pick a member from the ship's `crew` array.
But, how do we implement randomness in javascript? Take a look at the following code for some inspiration!

```
var number = 3;
var random_number = Math.floor(Math.random() * number);
console.log(random_number);
// Outpus either 0, 1, or 2 to the browser's console.
```

Once the `captain` function has been implemented, let's add another preflight message to the the launchpad, so that we can announce the captain of this particular launch.
Be sure to check how the code looks by running `node shipyard.js`, then give our first captain a high-five.

#### Step 5 - Building your spaceship's rockets!

Earth's gravity well is no small task to overcome. We're going to need some sturdy rockets to take us to the stars.

Create a `rocket` object, and assign it two properties:
 1. `fuel` which will default to `0`.
 2. `fire` which is going to be a function.

Now, we're going to write some code to fire the engines!
We want to make sure there is fuel in the tank, and if there is, we want to print that the rockets fired and remove some fuel.

Our `fire` function needs to:
* Check and see if there is fuel in the `fuel` property.
* If there is, subtract 1 from the `fuel` property, print that the engines have been fired, print the rocket's current fuel count, and return true.
* If there is not, print that the engines failed to fire and return false.

We're almost there!

#### Step 6 - Mount your rocket!

We're going to write some cool functions on the `ship` to attach our rocket.

Let's add a property to the `ship` called `propulsion` which is set initially to `null`.

Add another property to the `ship` called `mountPropulsion`, this is going to be a function that takes in an object and assigns it to the ship's `propulsion` property.
It should also print out that the engines were mounted!

Finish by passing in our `rocket` to the `launchpad` function. In the `launchpad` function, mount the rocket to our ship!

#### Step 7 - Blast off!

We've got all of our pieces together. Now we've got to blastoff!

Let's add a `takeoff` function on the `ship` that:
* `fire`s the propulsion drives.
* If the engines successfully fire, print a really convincing takeoff noise.
* If the engines fail to fire, print that takeoff was unsuccessful.

Once you are done, call the `takeoff` function in the launchpad function and take off!!

#### Step 8 - Blast Off Round Two!

Woops, we were so excited to blast off that we forgot to fuel our ship. Let's create a `fuelShip` function that will fuel our ship.

The `fuelShip` function should:
* accept an argument representing the amount of fuel we're adding.
* add the fuel amount to the `ship`'s mounted `propulsion` system.
* print that it has added set amount of fuel to its tanks.

After you are done, call this function in the `launchpad` and blast off!!!!

#### Step 9 - Add a countdown sequence!

Congrats! Our ship works. But...I feel like it's missing something...

...Of course! We need a countdown!

Let's create a `countdown` function whose first argument is an integer from which we will start the countdown.
* If the function receives `0` as an argument, it should print out that we're blasting off.
* If the number is not `0`, then the function should print out the number and *recursively* call itself with the next number in the countdown.

Now, just call the function in `launchpad`, and give it a run with `node shipyard.js`!

#### Step 10 - Slow down the countdown sequence!

The countdown is working, but it's going too fast. It would be great if there was a second delay between each number being printed out.

There's a special function in Javascript, [setTimeout()](https://developer.mozilla.org/en-US/docs/Web/API/WindowTimers/setTimeout) that executes code snippet after a specified delay.

Update your `countdown` function to use `setTimeout()` in order to have a one second delay between printing out the numbers.

#### Step 11 - The Final Countdown

Congrats, everyone! It looks like a successful... wait, why did the rockets fire before the countdown was finished?

Javascript executes its code in a very particular way. It goes line by line, scheduling the execution of each line of code.
However, some functions - like `setTimeout` - are _asynchronous_, and Javascript schedules them for the future.
This means that `ship.takeoff()` is firing before the countdown finishes.

How do we fix this? Well, we could use a popular pattern in Javascript called the `callback` pattern to register a `callback` for the asynchronous code to call at the appropriate time.
Callbacks are usually functions, but one could also pass an object and call a function on that object. Here's an example of a callback function:

```
var hello = function() {
  console.log("Outputted last");
}

var asynchronous_code = function(fn) {
  setTimeout(function() {
    console.log("Outputted first");
    fn();
  }, 1000);
}

asynchronous_code(hello);
```

Let's edit the countdown function to accept something we can run as a callback, and then update the launchpad accordingly.

Run `node shipyard.js`, and get ready for takeoff, Launchers!
