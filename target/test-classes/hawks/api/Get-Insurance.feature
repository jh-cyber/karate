Feature: Retrieve user

  Background: 
    Given url 'https://www.test-insurance.com/api/v1'
    * def result = callonce read('TokenGenerator.feature')
    * def tokenValue = result.token

  @get
  Scenario: get User by Id
    Given headers {Authorization: '#("Bearer " + tokenValue)'}
    Given path '/user/2471'
    When method get
    Then status 200
    And print response
