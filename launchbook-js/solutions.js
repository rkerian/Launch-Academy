// Exercise: Find the top navbar by query for the element type, which is <nav>.
document.getElementsByTagName("nav")[0];

// Exercise: Find the sidebar on the right by using it's id.
document.getElementsById('sidebar-right');

// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
document.getElementsByClass('pages')[0];
document.getElementsByClass('groups')[0];

// Exercise: Find all of the comments on the page.
document.getElementsByClassName('post');

// Exercise: Find the first comment on the page.
document.getElementsByClassName('post')[0];

// Exercise: Find the last comment on the page.
var posts = document.getElementsByClassName('post');
var lastPostIndex = posts.length - 1;
posts[lastPostIndex];

// Exercise: Find the fourth comment on the page.
document.getElementsByClassName('post')[3];

// Exercise: Find one of the ads in the sidebar and hide them.
var ad = document.getElementsByClassName('ad-slot')[0];
ad.style.visibility = "hidden";

// Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.
ad.style.visibility = "visible";

// Exercise: Use setAttribute to change src attribute of one of the ads in the sidebar.
var statusUpdate = document.getElementsByClassName('ad-slot')[0];
var imgDisplay = document.getElementsByTagName('img src')[0];
imgDisplay.setAttribute('http://placebear.com/200/300');

// Exercise: Find Sam's post and change it's text to something incredible.
var titleArea = document.getElementsByClassName('posts')[3];
var listElement = document.getElementsByClassName('media-body')[0];
var paragraph = document.getElementsByTagName('p')[0];
paragraph.innerHTML = "something incredible";

// Exercise: Find the first post and add the .post-liked class to it.
var favorites = document.getElementsByClassName('posts')[0];
var eventsLink = favorites.getElementsByTagName('li')[2];
eventsLink.className = eventsLink.className + "post-liked"

// Exercise: Find the second post and remove the .post-liked class.
var favorites = document.getElementsByClassName('favorites')[0];
var eventsLink = favorites.getElementsByTagName('li')[2];
eventsLink.classList.remove('post-liked');
