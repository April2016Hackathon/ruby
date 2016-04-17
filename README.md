# Hackathon API

Initial API setup for Hackathon

## General Rules


### Authorization

All authorized requests unless otherwise mentioned require an "**Auth-Token**" header to be present. Users are assigned an Auth Token during account creation.

### Errors

Any request that fails to be processed will contain an "errors" key in the returned JSON describing the problem.

## Routes

#### POST /signup

*This route is for managing registration of new users.*

Params:
* username: string
* email: string
* password: string

Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request**
```
{
	"username": "Bob",
	"email:" "Bob@bob.bob",
	"password": "password"
}
```

**Response**
```
{
	"user": {
		"username": "bob",
		"email": "bob@bob.bob",
		"auth_token": "c92692fd6c686ef6985b8eb124d37488"
	}
}
```

#### DELETE /signup

*This route is for deleting users.*

Params:
* username:string

Returns 202 Accepted on Success and 401 Unauthorized in case of failure.

**Request**
```
{
	"username": "Bob"
}
```

#### POST /login

*This route is for logging in created users.*

Params:
* username:string

Returns 200 OK on Success and 401 Unauthorized in case of failure.

**Request**
```
{
	"username": "Bob"
}
```

#### POST /auth/test

*Use this route to find the current logged in user.*

#### GET /posts/:id/responses

*This route is for showing all responses for a posting*

Params:
* posting_id: integer - this comes from the url (:id)

Returns 200 OK on Success and will throw an ActiveRecord::Record not found exception on failure.

#### POST /posts/:id/responses

*This route is for creating new responses.*

Params:
* posting_id: integer - this comes from the url (:id)

Returns 201 Created on success and 404 Not Found if the image id doesn't exist

#### GET /posts/index

*This route is for displaying an index of all postings.*

Returns 200 OK on success.

**Response**
```
{
  [
    {
      "user": "Tommy",
      "title": "Wild",
      "text": "Test stuff",
      "mood": false,
      "id": 1,
      "created_at": "2016-04-16T16:44:57.861Z"
    },
    {
      "user": "Mark",
      "title": "Mild",
      "text": "More test stuff",
      "mood": false,
      "id": 2,
      "created_at": "2016-04-16T16:46:18.574Z"
    }
  ]

}
```

#### POST /posts/create

*This route is to create a new posting.*

Params:
* user_id: integer
* text: string
* title: string
* mood: boolean

Returns 201 Created on success and 422 Unprocessable Entity on failure.

**Request**
```
{
  "user_id": "2"
  "text": "New"
  "title": "Howdy"
  "mood": "false"
}
```

**Response**
```
{
    "post": {
      "username": "Jessica",
      "id": 3,
      "user_id": 2,
      "text": "New",
      "title": "Howdy",
      "mood": false
    }
}
```

#### DELETE /posts/:id

*This route is to delete a posting.*

Params:
* posting_id: integer - this comes from the url (:id)

Returns 202 Accepted on Success and 401 Unauthorized in case of failure.


#### GET /posts/:user_id/newest

*This route is for getting the newest post of a user.*

**Response**
```
{
  "postings": {
    "id": 2,
    "user_id": 2,
    "text": "Hello",
    "title": "Hello again",
    "created_at": "2016-04-16T16:46:18.574Z",
    "updated_at": "2016-04-16T16:46:18.574Z",
    "mood": false
  }
}
```

#### GET /posts/:id/responses

*This response .*





#### POST /posts/:id/responses

*This response .*
