//YOUR CODE GOES HERE
function launchpad(ship, crew, rocket) {
  console.log("This rickety Javascript ship is about to sail.");
  console.log("Fueling of " + ship.name + " is complete.");
  ship.loadCrew(crew);
  console.log("Our silly captain for this journey is " + ship.captain().name + ".");
  ship.mountPropulsion(rocket);
  ship.fuelShip(2);
  countdown(5, ship);
};

var ship = {
  name: "Miss Ruby",
  crew: [],
  loadCrew: function(crewMembers) {
    for (var i = 0; i < crewMembers.length; i++) {
      this.crew.push(crewMembers[i]);
      console.log(crewMembers[i].name + " has been added to the crew.");
    }
  },
  captain: function() {
    var number = this.crew.length;
    return this.crew[Math.floor(Math.random() * number)];
  },
  propulsion: null,
  mountPropulsion: function(rocket) {
    this.propulsion = rocket;
    console.log("Engines successfully mounted.");
  },
  takeoff: function() {
    this.propulsion.fire ? console.log("vroom, vroom") : console.log("putt putt");
  },
  fuelShip: function(amount) {
    this.propulsion.fuel += amount;
    console.log("Added " + amount + " fuel to the tanks.");
  }
};

var crewNames = ["Ryan", "Chrissy", "Darlene"];

function trainCrew(crewNames) {
  var crew = [];
  for (var i = 0; i < crewNames.length; i++) {
    crew.push({ name: crewNames[i] });
  }
  return crew;
};

var crewMembers = trainCrew(crewNames);

var rocket = {
  fuel: 0,
  fire: function() {
    if (fuel > 0) {
      fuel--;
      return true;
    }
    else {
      console.log("Failed to fire");
      return false;
    }
  }
}

function countdown(ticker, ship) {
  if (ticker === 0) {
     console.log("Launching!");
     ship.takeoff();
  } else {
    // without setTimeout need to refer to this.countdown
    // with setTimeout need to refer to ship.countdown
    // WHY?
    setTimeout(function() {
      console.log(ticker);
      countdown(ticker - 1);
    }, 1000);
  }
}

//EOF
launchpad(ship, crewMembers, rocket);
