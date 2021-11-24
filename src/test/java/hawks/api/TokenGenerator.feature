Feature: Generate Token

Scenario: This scenario will generate token 
* def dataGenerator = Java.type('hawks.api.DataGenerator')
* def email = dataGenerator.getEmail()
* def password = dataGenerator.getPassword()
Given url 'https://www.test-insurance.com/api/v1'
And path '/adminRegistered'
When request {"email":#(email),"password":#(password)}
And method post
Then status 200
And print response
* def token = response.data.token.token