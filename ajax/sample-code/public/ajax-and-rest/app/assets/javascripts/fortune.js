$(function() {
  $("form#new_fortune").submit(function(event) {
    event.preventDefault();
    var newFortuneContent = $('#fortune_content').val();
    var newFortune = {
      fortune: {
        content: newFortuneContent
      }
    };

    var request = $.ajax({
      method: "POST",
      data: newFortune,
      url: "/api/fortunes.json"
    });

    request.done(function() {
      var html = "<div class='callout success'>" +
          newFortuneContent +
        "</div>";

      $("div.fortunes").append(html);
      $('#fortune_content').val("");
    });
  });
});
