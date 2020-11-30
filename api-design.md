
### Resources

- Articles / Posts:
    - 2020-10-08 - [Why do microservices need an API Gateway?](https://dev.to/rahul_ramfort/why-do-microservices-need-an-api-gateway-503i)

- [shieldfy/API-Security-Checklist](https://github.com/shieldfy/API-Security-Checklist) - Checklist of the most important security countermeasures when designing, testing, and releasing your API
- 2018-12-01 - Microsoft Azure Docs - [Web API design](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
- [interagent/http-api-design](https://github.com/interagent/http-api-design) - HTTP API design guide extracted from work on the Heroku Platform API
- 2020-03-02 - [Best practices for REST API design](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/)
- 2020-05-14 - [Best Practices for Designing a Pragmatic RESTful API](https://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
    - An API is a user interface for a developer - so put some effort into making it pleasant
    - Use RESTful URLs and actions
    - Use SSL everywhere, no exceptions
    - An API is only as good as its documentation - so have great documentation
    - Version via the URL, not via headers
    - Use query parameters for advanced filtering, sorting & searching
    - Provide a way to limit which fields are returned from the API
    - Return something useful from POST, PATCH & PUT requests
    - HATEOAS isn't practical just yet
    - Use JSON where possible, XML only if you have to
    - You should use camelCase with JSON, but snake_case is 20% easier to read
    - Pretty print by default & ensure gzip is supported
    - Don't use response envelopes by default
    - Consider using JSON for POST, PUT and PATCH request bodies
    - Paginate using Link headers
    - Provide a way to autoload related resource representations
    - Provide a way to override the HTTP method
    - Provide useful response headers for rate limiting
    - Use token based authentication, transported over OAuth2 where delegation is needed
    - Include response headers that facilitate caching
    - Define a consumable error payload
    - Effectively use HTTP Status codes
- 2020-02-25 - [API Design Patterns for REST API Web Services Design](https://stoplight.io/blog/api-design-patterns-for-rest-web-services/)
- 2020-04-30 - [All You Need to Know About REST API Design](https://nordicapis.com/all-you-need-to-know-about-rest-api-design/)
- 2017-09-13 - [Know how RESTful your API is: An Overview of the Richardson Maturity Model](https://developers.redhat.com/blog/2017/09/13/know-how-restful-your-api-is-an-overview-of-the-richardson-maturity-model/)
- 2010-03-18 - [Richardson Maturity Model](https://martinfowler.com/articles/richardsonMaturityModel.html)
- 2020-10-07 - [Introducing The Good Documentation Checklist](https://blog.postman.com/postman-good-documentation-checklist/)
- 2020-07-20 - [How Postman Engineering Does Microservices Today](https://blog.postman.com/postman-engineering-microservices-example/)
- 2020-09-30 - [2020 State of the API Report](https://www.postman.com/state-of-api/) - [blog post](https://blog.postman.com/announcing-2020-state-of-api-report/)


- Blogs:
    - [Postman](https://blog.postman.com/) - The Collaboration Platform for API Development
    - [Stoplight](https://stoplight.io/blog/) - Design, Document & Build Quality APIs Faster
