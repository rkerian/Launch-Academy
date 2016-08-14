### Introduction

Providing a smooth user experience by limiting the number of disruptions can greatly improve the usability of a site. In this article we will discuss **AJAX**, a technique which involves communicating with web server over HTTP, without a page refresh.


### Learning Goals

* Use jQuery functions to send HTTP requests asynchronously.
* Understand when it is necessary to communicate with the server to retrieve more information.
* Understand how data is transferred between the client and server using AJAX and HTTP.
* Learn how to utilize the JSON format.


### What is AJAX?

![AJAX](https://s3.amazonaws.com/horizon-production/images/BeEVMiF.png)

JavaScript is often used to make a web page more interactive by responding to user events with custom written code (also known as event handlers). This code runs within the browser, executes after the page has been loaded, and is isolated to the user's (or client's) browser. Since JavaScript code execution is isolated to the client, it does not send information back to the server about events that are triggered. We can utilize this functionality in cases where we want to make changes to the page based on the user's actions (eg - using JavaScript to hide or show a form on the page by clicking on some element in the page).

There are times when we want to handle a user event, but we require some new information which resides on the server. Or, we would like user interaction to permanently modify a resource on the server. Consider, for a moment, the never-ending list of messages on your Twitter homepage. When you scroll to the bottom of the page, this triggers an event. JavaScript code is then executed, which asks Twitter servers for more data. Twitter responds with a new batch of messages, and JavaScript code on the client inserts them into the Document Object Model (DOM). Now, you are viewing the latest and greatest tweets.


### Asynchronous Communication

When we communicate with the server in the background, we often refer to this as **asynchronous communication**. Because the request for more information happens in parallel with the user browsing the page, it does not interrupt their flow and provides a much smoother experience.

So how do we actually communicate with the server asynchronously? JavaScript includes the **XMLHttpRequest** interface which lets us construct and send HTTP requests without refreshing the page. In fact, this technique of sending requests in the background is usually referred to as **Asynchronous JavaScript and XML**, or [**AJAX**](http://api.jquery.com/jquery.ajax/).

The `XMLHttpRequest` object is cumbersome to use directly (and oddly enough does not require the use of XML). Fortunately, the jQuery library provides some helpful functions that simplify sending requests and handling the responses. Here's an example of sending a GET request to the `/widgets` path:

```javascript
var request = $.ajax({
  method: "GET",
  url: "/widgets"
});

request.done(function(data) { alert(data); });
```

Here we're calling the jQuery `ajax` function and supplying the **path** and **method**, just like with any HTTP request. (`$` is an alias for `jQuery` in this example). Below that we also specify what to do with the data that comes back in the response. When this code runs, it will display the response data in an alert box when it is available.

The [jQuery library](http://api.jquery.com/jQuery.ajax/) gives us other useful functions to perform HTTP requests. The `get` function for retrieving, or **reading** data. And the `post` function, for **creating** new data:

```javascript
var request = $.get({ url: "/widgets" });
```

```javascript
var request = $.post({
  url: "/widgets",
  data: {
    name: "Gearbox Widget"
  }
});
```

### The Server-Side API

AJAX involves communication between both the client (i.e. the browser) and the web server. If an API endpoint is not provided for us, we will need to write the client-side JavaScript to initiate the request, as well as the code for our web server to handle requests to create, read, update, and delete data.

Consider what happens when a user visits a page for the first time. The browser sends a request to the web server and it will most likely respond with some HTML for the browser to render. The HTML lets us structure the content on the page so that we can apply subsequent styles with CSS and write JavaScript to query and modify portions of the page. If we look at a simplified version of Twitter, the HTML might look something like this:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Recent Tweets</title>
    <link rel="stylesheet" href="/css/styles.css">
  </head>
  <body>
    <h1>Recent Tweets</h1>

    <ul id="tweet-list">
      <li>I'm a tweet on the first page.</li>
      <li>I'm also a tweet.</li>
      <li>It's difficult to come up with new tweets.</li>
      <li>I think four tweets is enough.</li>
    </ul>

    <script src="/js/app.js"></script>
  </body>
</html>
```

Here we have a list of tweets in a `<ul>` tag, but we also get a lot of surrounding tags to support rendering the page in a browser. When the user then scrolls to the bottom of the page and we want to request the next round of tweets with AJAX, we want to end up with a modified `<ul>` that looks something like:

```html
<ul id="tweet-list">
  <li>I'm a tweet on the first page.</li>
  <li>I'm also a tweet.</li>
  <li>It's difficult to come up with new tweets.</li>
  <li>I think four tweets is enough.</li>
  <!-- These are the new tweets that we want to retrieve via AJAX -->
  <li>This is the next round of tweets.</li>
  <li>These will be retrieved via AJAX.</li>
  <li>I don't want any other HTML, just these tweets.</li>
  <li>Is there a way to get just this data?</li>
</ul>
```

Even though we only care about the four new tweets, if the server treats all requests the same it will return those tweets along with all of the surrounding HTML which is redundant. An alternative is to send the tweets in a different format that only contains the relevant data and is easier to use within JavaScript. The above tweets could be sent over as **JSON** which looks something like:

```json
{
  "tweets": [
    "This is the next round of tweets.",
    "These will be retrieved via AJAX.",
    "I don't want any other HTML, just these tweets.",
    "Is there a way to get just this data?"
  ]
}
```

Notice how this structure is similar to Hashes and Arrays in Ruby. JSON stands for **JavaScript Object Notation** which means that the above structure can be easily parsed and treated as an Object in JavaScript (similar to a Hash in Ruby). It also has the beneficial side effect of being easy for humans to read, as well. If you don't believe me, [go look at some XML](http://www.xmlfiles.com/examples/simple.xml).

Using JSON to send data back and forth between the client and server is common when using AJAX. Consider the following snippet:

```javascript

var request = $.ajax({
  method: "GET",
  url: "/tweets.json?page=2"
});

request.done(function(data) {
  data["tweets"].forEach(function(tweet) {
    $("#tweet-list").append("<li>" + tweet + "</li>");
  })
});
```

Here, we first issue an HTTP GET request to `/tweets.json?page=2` which we assume will return the second round of tweets in JSON format. We then defined a function that will receive the JSON data and append each tweet to the `<ul id="tweet-list">` element. Notice how we can use `data["tweets"]` directly which returns an array in JavaScript. The `$("#tweet-list").append("<li>" + tweet + "</li>")` line will append each tweet to the existing `<ul>` list on the page.

This is how AJAX can be used to fetch new information for a page. The initial request loads the HTML for the browser to render along with any CSS and JavaScript. To keep the page updated, JavaScript requests new _data_ in the background and uses this data to update the existing HTML.

### Fortune Teller

Let's build a simple fortune teller Sinatra application. First, we will build it so that it utilizes an HTML form to issue a `GET` request to refresh the page. Once we get this working, we will modify our app so that it will utilize AJAX.

To get started, create a new directory for the project and add a *server.rb* file:

```ruby
require "sinatra"
require "json"

get "/" do
  redirect to("/new-fortune")
end

get "/new-fortune" do
  @fortune = random_fortune
  erb :index
end

def random_fortune
  FORTUNES.sample
end

FORTUNES = [
  "Expect a letter from a friend who will ask a favor of you.",
  "You are taking yourself far too seriously.",
  "Bank error in your favor.  Collect $200.",
  "Your true value depends entirely on what you are compared with.",
  "Don't let your mind wander -- it's too little to be let out alone.",
  "You will be imprisoned for contributing your time and skill to a bank robbery.",
  "Whenever you find that you are on the side of the majority, it is time to reform.",
  "You are confused; but this is your normal state.",
  "Don't read everything you believe.",
  "Keep it short for pithy sake.",
  "Abandon the search for Truth; settle for a good fantasy.",
  "Try to relax and enjoy the crisis.",
  "You will be awarded some great honor.",
  "Tuesday After Lunch is the cosmic time of the week.",
  "Blow it out your ear.",
  "You definitely intend to start living sometime soon.",
  "Don't tell any big lies today.  Small ones can be just as effective.",
  "Don't worry, be happy.",
  "Another good night not to sleep in a eucalyptus tree."
]
```

In, `views/index.erb`:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Fortune Teller</title>
  </head>

  <body>
    <h1>Fortune Teller!</h1>

    <p>Your fortune is:
      <span id="fortune">
        <%= @fortune %>
      </span>
    </p>

    <form action="/new-fortune" method="get">
      <button id="new-fortune" type="submit">New Fortune!</button>
    </form>

    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="/js/fortune.js"></script>
  </body>
</html>
```

Here, we have an app which will provide the user a random fortune, using plain old HTTP and HTML. Try it out.

We now want to modify this app so that instead of the entire page refreshing on every click of the "New Fortune" button, only the fortune changes.

When the page loads, it will display an initial fortune in the HTML returned from the server. Using JavaScript, we will prevent the default action of submitting the form and make an **AJAX request** for a fortune. Rather than storing all of the possible fortunes in the HTML sent to the client, we'll use AJAX to ask the server for a new fortune once the button has been clicked.

Based on this design, our web server will need to support two routes: one to load the initial page in HTML and another one to return just a single fortune to update the page. For the second route we could send it as plain text since it is a simple string, but in this case we'll use JSON to demonstrate how it fits in with Sinatra.

Add the following code to your `server.rb`:

```ruby
get "/new-fortune.json" do
  content_type :json

  { fortune: random_fortune }.to_json
end
```

Our app has two routes: `GET /new-fortune` and `GET /new-fortune.json`. The first route will render a view and we pass in a random fortune that we sampled from the array at the bottom of the file.

The `GET /new-fortune.json` route will only return the fortune in JSON format. We specify `content_type :json` so that when Sinatra generates the HTTP response it includes a `Content-Type: application/json` header. The **Content-Type** header is used to let browsers and other programs know what kind of data to expect in the response body.

To generate the JSON data we can call the `to_json` method on a Ruby Hash. This method is available after calling `require "json"` at the top of the file and will return a string of the Hash contents converted to JSON which serves as the response body. To test this out, try visiting [http://localhost:4567/new-fortune.json](http://localhost:4567/new-fortune.json) once the server is running to verify it is returning a random fortune each time.

```json
{"fortune":"You are taking yourself far too seriously."}
```

One other thing to note is that the `.json` at the end of the path is a convention but not required (i.e. we could have chosen `GET /new-fortune` instead without the `.json` suffix). The suffix helps when we have want to view the same information in more than one way. For example, we might want to visit `GET /tweets` to load an HTML page containing a list of tweets or use `GET /tweets.json` to retrieve just the tweet data without the HTML context. As an example of this in action, try visiting [https://jobs.github.com/positions](https://jobs.github.com/positions) as well as [https://jobs.github.com/positions.json](https://jobs.github.com/positions.json) (or even [https://jobs.github.com/positions.xml](https://jobs.github.com/positions.xml)). Same information viewed in different formats.

Here we have an ERB template that wraps the fortune in a `<span id="fortune">` tag so that we can easily access it in the future. We also include `<button id="new-fortune">` so that the user has a way to refresh the fortune.

At the bottom of the page is where we include our JavaScript. We're relying on jQuery to define our event handlers and to make the AJAX call so we need to include that first. We're loading it a bit differently in that we include `<script src="//code.jquery.com/jquery-2.1.3.min.js">` rather than trying to load a file local to our application. This is an example of using a **Content Delivery Network (CDN)** rather than self-hosting the library ourselves. CDNs are beneficial in that they offload some of the bandwidth requirements on our servers and enable browsers to cache popular libraries between sites so they don't have to repeatedly download them. In this case it's also easier to test out a library without having to add it to our application first.

Write the Javascript to complete the feature and place it in `public/js/fortune.js`:

```javascript
// Capture user interaction with the "New Fortune" button.
// Prevent the default behavior, and submit an AJAX GET request.
$("#new-fortune").on("click", function(event) {
  event.preventDefault();

  var request = $.ajax({
    method: "GET",
    url: "/new-fortune.json"
  });

  // Upon a successful response, insert the new fortune into
  // the DOM.
  request.done(function(newFortune) {
    $("#fortune").text(newFortune["fortune"]);
  });
});
```

This code first finds the button using the ID selector (`$("#new-fortune")`) and attaches an event handler for when it is clicked. That triggers the AJAX call which sends a request back to the server for a new fortune. When the server responds with JSON, we can update the content of the `<span id="fortune">` tag with the jQuery `text` function.

Once these three files are in place, visiting [http://localhost:4567/](http://localhost:4567/) should display your fortune. If you don't like it, click the button for a new one!

### In Summary

To improve the user experience on a page it is often desirable to retrieve or submit new information without having to refresh the page. **AJAX** is a technique for communicating between the client and the server asynchronously using JavaScript. jQuery provides several functions to simplify sending requests and handling the responses.

When exchanging data in the background we usually don't need the structure of HTML since the page has already been loaded. **JSON** is a popular format for passing data back and forth that is easily parsed by JavaScript.

Although AJAX can vastly improve the user experience by avoiding page refreshes, it does come at the cost of increased complexity in application development.
