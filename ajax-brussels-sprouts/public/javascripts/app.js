$('#get-dish').on('click', function(event) {
  event.preventDefault();

  // request a new dish and alert the user
  $.get("/dishes/random.json", function(newDish) {
    alert("Your random dish is: " + newDish["dish"]);
  });
});
