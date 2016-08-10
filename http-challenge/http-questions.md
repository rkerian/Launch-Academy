## HTTP Questions

These questions will help to reinforce your understanding of the HTTP protocol. Use the readings on HTTP, your notes, your peers, and good-old trusty Google to answer the following questions:

* * *
**Q: What are the five HTTP verbs we use to Create, Read, Update, and Delete resources on the web?**

A: POST, GET, PUT, PATCH, DELETE



* * *
**Q: Define each of the HTTP verbs in question #1.**

A: POST - create new resources
GET - read or retrieve the representation of a resource
PUT - update or replace
PATCH - update or modify, can just change part of a resource and not just the entire resource
DELETE - deletes resource



* * *
**Q: What are the components of a HTTP request?**

A: 1) HTTP request method, URI and protocol version
2) HTTP request headers
3) HTTP request body



* * *
**Q: What are the components of a HTTP response?**

A: 1) Protocol, status code and description of status
2) HTTP response headers
3) HTTP response body



* * *
**Q: What is a Status Code?**

A: Part of the response to an HTTP request that indicates whether processing of the request was successful or returned an error



* * *
**Q: What are the different types of Status Codes? List a few Status Codes which you think are important to remember.**

A: 200 - OK, 404 - Not Found, 409 - Conflict, 201 - Created



* * *
**Q: Can you draw the HTTP Request/Response cycle from memory?**

**Note:** It is **highly likely** someone will ask you to do this in an interview setting. Try it out on a whiteboard or on paper, now.

A: yeppers



* * *
**Q: What is the difference between the `PUT` and `PATCH` HTTP verbs?**

A: put is used to replace an entire resource, patch can be used to update part of that resource



* * *
**Q: Name the different parts of the following URL**

```
-                      2                             4
            ┌──────────┴──────────┐         ┌────────┴────────┐
    https://learn.launchacademy.com/searches?utf8=✓&query=rspec
    └─┬─┘                          └───┬───┘
      1                                3
```

A:

    1. protocol

    2. domain name

    3. path

    4. parameters/query

* * *
