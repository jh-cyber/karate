Feature: First Karate Feature

Background:
	Given url 'https://jsonplaceholder.typicode.com'
	
	Scenario: get all posts 
	Given path '/posts'
	When method get
	Then status 200
	* def firstID = response[0].id
	* print 'the ID for first Json obj', firstID
	* match firstID == 1
	* def title = response[0].title
	* match title contains 'sunt'
	
	
	@createMethod
	Scenario: create a post 
	Given path '/posts'
	And request 
	"""
	{
    "userId": 10,
    "id": 101,
    "title": "This is first Post",
    "body": "We are almost done with class, just one more month and then we will be SDETs"
    }
  """
  When method post 
  Then status 201
  * def userID = response.userId
  * match userID == 10
  * def id = response.id
  * match id == 101
  * def title = response.title
  * match title contains 'first'
  * def body = response.body
  * match body contains 'We are almost done with class'
  
  
  	@outline
	Scenario Outline: create a post 
	Given path '/posts'
	And request 
	"""
	{
    "userId": <userID>,
    "id": <id>,
    "title": "<title>",
    "body": "<body>"
    }
  """
  When method post 
  Then status 201
  * def userID = response.userId
  * match userID == <userID>
  * def id = response.id
  * match id == <id>
  * def title = response.title
  * match title contains '<title>'
  * def body = response.body
  * match body contains '<body>'
	
	Examples:
	|userID|id|title		 |body				 |
	|10|101|This is test1|This is body1|
	|10|101|This is test2|This is body2|
	|10|101|This is test3|This is body3|
	|10|101|This is test4|This is body4|
	|10|101|This is test5|This is body5|