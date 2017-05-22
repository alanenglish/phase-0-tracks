What are some common HTTP status codes?
1XX = Informational Responses. Indicates that the request was received and understood. Issued on a provisional basis while request processing continues, alerts the client to wait for final response. Message consists only of the status line and optional header fields, and is terminated by an empty line.

100 Continue - server received request headers and client should send request body
101 Switching Protocols - requester asked server to switch protocols and server agreed
102 Processing - indicates server received and is processing request, but no response yet

2XX = Success. Class indicates the action requested by the client was received, understood, accepted, and processed successfully.

200 OK - standard response for successful requests
201 Created - request fulfilled, resulting in creation of new resource
202 Accepted - accepted for processing, but not completed
203 Non-Authoritative Info - server is transforming proxy that received 200 OK, but is returing modified version
204 No Content - successful process of request, no content returned
205 Reset Content - successful process of request, but not returning content, requires requester reset document view
206 Partial Content - server delivering only part of resource due to range header sent by client
207 Multi Status - XML message which may contain a number of separate response codes
208 Already Reported - members of DAV binding already enumerated in previous part of response, not being included again
226 IM Used - server fulfilled request for resource, response is a representation of result of one or more instance manipulations applied to current instance

3XX = Redirection. Indicates the client must take additional action to complete the request, many of these codes are used in URL redirection.

300 Multiple Choices - multiple options for resource from which client may choose
301 Moved Permanently - this and future requests should be directed to given URL
302 Found - some web apps still use this code as if it were 303
303 See Other - response to request can be found under another URI using GET method
304 Not Modified - resource has not been modified since the version specified by request headers
305 Use Proxy - indicates resource is available only through a proxy, address is provided in response
307 Temporary Redirect - request should be repeated with another URI
308 Permanent Redirect - request and all future should be repeated using another URI

4XX = Client Errors. Intended for situations in which the client seems to have erred. Expect when responding to HEAD request, server should include an entity containing an explanation of the erred situation, and whether it is a temporary or permanent condition.

400 Bad Request - server cannot or will not process request due to apparent client error
401 Unauthorized - authentication is required and has failed or has not yet been provided
402 Payment Required - reserved for future use
403 Forbidden - request was valid, bet server is refusing action - user might not have permissions for resource
404 Not Found - resource could not be foudn but may be available in future
405 Method Not Allowed - request method is not supported for requested resource
406 Not Acceptable - requested resource capable of generating only content not acceptable according to Accept headers sent
407 Proxy Authentication Required - client must first authenticate itself with proxy
408 Request Timeout - server timed out waiting for response
409 Conflict - request could not be processed because of conflict
410 Gone - resource requested no longer available and will not be available again
411 Length Required - request didn't specify length of content, which is required
412 Precondition Failed - server doesn't meet a precondition
413 Payload Too Large - request is larger than server is willing to process
414 URI Too Long - URI provided too long for server to process
415 Unsupported Media Type - request has media type server or resource doesn't support
416 Range Not Satisfiable - client asked for portion, but server cannot supply portion
417 Expectation Failed - server cannot meet requirements of Expect request header
421 Misdirected Request - request directed at server not able to produce response
422 Unprocessable Entity - request well formed but unable to be followed due to semantic errors
423 Locked - resource being accessed is locked
424 - Failed Dependency - request failed due to failure of previous request
426 Upgrade Required - client should switch to different protocol
428 Prevondition Required - origin server requires request to be conditional
429 - Too Many Requests - user sent too many requests in given amount of time
431 Request Header Fields Too Large - server unwilling to process request because too large
451 Unavailable For Legal Reasons - server operator received legal demand to deny access

5XX = Server Error. Server failed to fulfill an apparently valid request. Server is aware that it has encountered an error or is otherwise incapable of performing the request.

500 Internal Server Error - generic error message, given when unexpected condition was encountered
501 Not Implemented - server doesn't recognize request method, or lacks ability to fulfill
502 Bad Gateway - Server was acting gateway or proxy and received an invalid response from the upstream server
503 Service Unavailable - server currently unavailable
504 Gateway Timeout - server was acting gateway or proxy and did not receive timely response from upstream server
505 HTTP Version Not Supported - server doesn't support the HTTP protocol version used in request
506 Variant Also Negotiates - content negotiation for request results in circular reference
507 Insufficient Storage - server unable to store representation needed to complete request
508 Loop Detected - server detected infinite loop
510 Not Extended - further extensions to request are required for server to fulfill
511 Network Authentication Required - client needs authentication to gain access.

What is the difference between a GET request and a POST request? When might each be used?

GET requests data from a specified resource, while POST submits data to be processed to a specified resource. 

POST requests supple additional data from the browser to the server in the message body. In contrast, GET requests include all required data in the URL. Forms in HTML can use either method by specifying POST or GET in the form element. The method specified determines how form data is submitted to the server. When GET, all form data is encoded into the URL. appended to the action URL as query string parameters. With POST, form data appears within the message body of the HTTP request.

Use GET for safe actions and POST for unsafe actions. GET requests can be cached, remain in browser history, can be bookmarked, distributed and shared, and can be hacked. GET requests should never be used when dealing with sensitive data for those reasons, and have length restrictions. They should be used only to retrieve data. POST requests are never cached, they do not remain in browser history, that cannot be bookmarked, and have no restrictions on data length.

Use POST when dealing with sensitive data. Because query strings are transferred openly in GET, have to consider our security and that of our users when dealing with sensitive data like passwords and credit card information. Users, because they may not realize that they are sharing sensitive data when they share a URL or that it can be viewed in the browser history by another user using the same computer. Ourselves, because we may be breaking laws by unexpectedly storing data that we're not allowed to.

Use POST when dealing with long requests, some browsers enforce maximum URL length characters.

What is a cookie? How does it relate to HTTP requests?

A cookie is a small piece of data sent from a website and stored on the users computer by the users web browser while the user is browsing. They were designed to be a reliable mechanism for websites to remember stateful information (shopping cart) or to record the users browsing activity. Also used to remember arbitrary pieces of info that user previously entered into form fields, etc. 

Cookies are passed as HTTP headers, both in the request and in the response. 




