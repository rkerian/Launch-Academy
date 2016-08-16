$("form").submit(function(event) {
  event.preventDefault();
  var submission = $('#grocery_name').val();

  !submission ? alert("No blank submissions") : postGrocery(submission);
});

function postGrocery(input) {
    $.ajax({
      type: "POST",
      url: "/groceries",
      data: { name: input },
      success: function() {
        $('#grocery-list').append("<li class='item'>" + "<div class=\"line\">" + input)
      }
    });
}
