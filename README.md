# README

To run this codebase, in a terminal window run 'rails server'. This will set up the endpoints on `http://localhost:3000`

To run the test suite, run `rake test` in the top-level directory

-Design Decisions

I decided to use Rails. It's obviously overkill for an hour long assignment, but it's the framework I'm
most familiar with and could get started on most quickly (rather than learning Sinatra for the assignment)

I made some assumptions on the endpoint. I assumed that a book id and a request id were different,
and that 'request data' was the response you get from the POST endpoint.

I have a Request controller, a Request request spec, a Book model, and a Request model.
