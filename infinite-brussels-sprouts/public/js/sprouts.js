// YOUR CODE GOES HERE
var page = 2;

$(window).on('scroll', (function() {
  if($(window).scrollTop() == $(document).height() - $(window).height()) {

     $.get("/tweets.json?page=" + (page), function(data) {
       page++;
       data.forEach(function(tweets) {
         var $newTweetText = "<div class='body'>" + tweets.text + "</div>";
         var $newTweetUser = "<div class='user'>" + tweets.username + "</div>";
         var $appendMe = "<li class='tweet'>" + $newTweetText + $newTweetUser + "</li>";

         $(".tweets").append($appendMe);
       }
     }
   }
});
