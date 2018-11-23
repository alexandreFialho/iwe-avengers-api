Feature: Perform integrated tests on the Avengers registration API

Background:
* url 'https://4or8a61y5f.execute-api.us-east-2.amazonaws.com/dev'

Scenario: Get Avenger by Id

Given path 'avengers','aaaa-bbbb-cccc-dddd'
When method get
Then status 200
And match response == {id:'#string', name: 'Iron Man', secretIdentity: 'Tony Stark'}


Scenario: Create Avenger

Given path 'avengers'
And request {name:'Iron Man' , secretIdentity: 'Tony Stark'}
When method post
Then status 201
And match response == {id: '#string', name: 'Iron Man', secretIdentity: 'Tony Stark' }


Scenario: Must return 400 for invalid creation payload

Given path 'avengers'
And request {secretIdentity: 'Tony Stark'}
When method post
Then status 400

Scenario: Delete avengers

Given path 'avengers','aaaa-bbbb-cccc-dddd '
When method delete
Then status 204

Scenario: Put avengers

Given path 'avengers','aaaa-bbbb-cccc-dddd'
And request {name:'Iron Man' , secretIdentity: 'Tony Stark'}
When method put
Then status 200
And match response == {id: '#string', name: 'Iron Man', secretIdentity: 'Tony Stark' }


Scenario: Must return 400 for invalid update payload

Given path 'avengers','aaa-bbbb--dddd'
And request {secretIdentity: 'Tony Stark'}
When method put
Then status 400

