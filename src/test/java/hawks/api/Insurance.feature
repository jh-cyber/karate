Feature: Testing for Rest Api using Karate

  Background: 
    * def requestBody = read('payload.json')
    * def dataGenerator = Java.type('hawks.api.DataGenerator')
    * set requestBody.primaryPerson.email = dataGenerator.getRandomArticleValues().email
    * def emailValue = dataGenerator.getEmail()
    * def firstnameValue = dataGenerator.getFirstName()
    * def titleValue = dataGenerator.getTitle()
    * def lastNameValue = dataGenerator.getLastName()
    * def genderValue = dataGenerator.getGender()
    Given url 'https://www.test-insurance.com/api/v1'
    * def result = callonce read('TokenGenerator.feature')
    * def tokenValue = result.token

  @tst
  Scenario: E2E Testing
    Given headers {Authorization: '#("Bearer " + tokenValue)'}
    Given path '/user'
    When request requestBody
    When method Post
    Then status 200
    And print response