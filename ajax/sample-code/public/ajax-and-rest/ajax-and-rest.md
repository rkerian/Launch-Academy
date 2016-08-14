## Interacting with a RESTful Interface Using AJAX

In this article, we will cover **Representational State Transfer**, or **REST**, in a beginner-friendly way. If you care to bore yourself with the technical details of this specification, please check out the article on [Wikipedia](https://en.wikipedia.org/wiki/Representational_state_transfer), or [Roy Fielding's Dissertation](https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm) on the subject.

### Mapping Verbs to Actions

One of the key ideas behind REST is to define a mapping between HTTP Requests and the actions performed on the server-side.

The HTTP Verbs we are concerned with as Web Developers are as follows:

* `GET`
* `POST`
* `PUT`/`PATCH`
* `DELETE`

We would like to map these HTTP Verbs to CRUD actions on the server-side. So, when a client makes a HTTP Request (which consists of a HTTP Verb and a Path), the server will perform a **C**reate, **R**ead, **U**pdate, or **D**elete action on a resource.

REST defines this mapping as so:

| HTTP Verb | Server Action |
| --- | --- |
| `GET` | Read |
| `POST` | Create |
| `PUT`/`PATCH` | Update |
| `DELETE` | Delete |

A more complete description of a **RESTful** web service can be found, [here](http://www.restapitutorial.com/lessons/httpmethods.html)

### Implementing REST on the Server

We have provided a RESTful JSON interface for fortunes for you.

```no-highlight
$ et get ajax-and-rest
$ cd ajax-and-rest
$ bundle
$ rake db:create db:migrate db:seed
$ rails server
```

The `rake routes` command will show us that the following routes exist in our application.

| HTTP Verb | Path | Server Action |
| --- | --- | --- |
| `GET` | `/api/fortunes.json` | Read all the fortunes |
| `GET` | `/api/fortunes/:id.json` | Read the fortune with the specified id |
| `POST` | `/api/fortunes.json` | Create a new fortune |
| `PUT/PATCH` | `/api/fortunes/:id.json` | Update the fortune with the specified id |
| `DELETE` | `/api/fortunes/:id.json`| Delete the fortune with the specified id |

Try visiting some of the `.json` paths that are defined.

![JSON Fortunes](https://s3.amazonaws.com/horizon-production/images/fortunes-json.png)

### AJAXing it up

With our server interface defined, we can interact with that interface by writing some client-side JavaScript. Let's start by adding a new fortune. Visit the [index of fortunes](http://localhost:3000/fortunes) in the app and try out the following code in the Chrome Developer Console.

```javascript
// create a fortune
// http://api.jquery.com/jquery.ajax/
//
var fortune = {
  fortune: {
    content: "Walk through life like a badass."
  }
};

var request = $.ajax({
  method: "POST",
  url: "/api/fortunes.json",
  data: fortune,
});

request.done(function() {
    alert("New fortune accepted");
});
```

In order to check that this was successful, we need to refresh the page.

Let's build a feature that allows the user to enter a new fortune via a form, creates a new record by posting that data to the server via AJAX, and, upon a successful response, updates the page with that new record.


### HTML + HTTP, first

Before we dive into implementing this feature using AJAX, let's get a form working without it. Every modern browser supports JavaScript, but, it is a worthwhile exercise to get form submission working without it. There are a number of things we will reuse between a plain old HTML form submission (the form, the code for saving the data). Plus, it is just good _form_ to have this to fall back on if JS is disabled on the client browser.

```erb
<!-- views/fortunes/index.erb -->
<!-- ... -->

<%= form_for :fortune do |f| %>
  <%= f.label :content %>
  <%= f.text_field :content %>
  <%= f.submit %>
<% end %>
```

Which generates the following HTML

```html
<form action="/fortunes" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <input type="hidden" name="authenticity_token" value="--redacted--" />
  <label for="fortune_content">Content</label>
  <input type="text" name="fortune[content]" id="fortune_content" />
  <input type="submit" name="commit" value="Save fortune" data-disable-with="Save fortune" />
</form>
```

The `fortunes#create` action in our controller can be implemented as follows...

```ruby
# app/controllers/fortunes_controller.rb

class FortunesController < ApplicationController
  def create
    @fortune = Fortune.new(fortune_params)
    if @fortune.save
      redirect_to :index, success: "Fortune created!"
    else
      render :index, alert: "There was a problem with your request!"
    end
  end
end
```

### AJAX POST

Now that the feature for adding a new fortune is wired up, let's make it happen without a full page reload.

There are a few steps to get this to work.

1. Prevent the form from submitting normally.
2. Post the form data via AJAX to `/api/fortunes.json`.
3. Upon success, update the page.

```javascript
# app/assets/javascripts/fortune.js

// create a new fortune and update the page
//
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
```

We need code on the server-side to handle the `POST`ing of a new fortune via JavaScript.

```ruby
# app/controllers/api/fortunes_controller.rb

  def create
    @fortune = Fortune.new(fortune_params)

    if @fortune.save
      render json: { fortunes: @fortune },
        status: :created,
        location: api_fortune_url(@fortune)
    else
      render json: @fortune.errors,
        status: :unprocessable_entity
    end
  end
```

### Front-end Programming

There is a general set of steps for implementing AJAX functionality in a web application:

1. User interacts with the page (via clicking on some element in the [Document Object Model](https://en.wikipedia.org/wiki/Document_Object_Model), or **DOM**).
2. This triggers a JavaScript **event handler** (e.g.- `function(event) {}`), which makes a HTTP request to the server.
3. When the server responds to the HTTP request, a JavaScript **callback function** is executed (e.g.- `request.done(function() {})`), which updates the DOM.

## Other HTTP methods

Here are code examples which can be run from your browser's developer console. Implementing this functionality in the Fortune Teller web application is left as an exercise for the reader.

### AJAX PUT

```javascript
// update a fortune
// http://api.jquery.com/jquery.ajax/
//
requestData = {
  method: "PUT",
  url: "/api/fortunes/8.json",
  data: { fortune: { content: "You are confused; but clarity will come soon." } }
};

var request = $.ajax(requestData);
request.done(function() {
  alert("Updated the fortune");
});
```

### AJAX DELETE

```javascript
// delete a fortune
// http://api.jquery.com/jquery.ajax/
//
var requestData = {
  method: "DELETE",
  url: "/api/fortunes/10.json"
};

var request = $.ajax(requestData);
request.done(function() {
  alert("Deleted that terrible fortune");
});
```

## Wrap Up

In this article, we covered how to create a web form that submits **asynchronously**. The benefits of which are that we do not need a full page reload, which creates a more elegant user experience.
