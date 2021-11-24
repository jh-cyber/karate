Feature: End to End Testing for Rest Api using Karate

  Background: 
    * def dataGenerator = Java.type('hawks.api.DataGenerator')
    * def emailValue = dataGenerator.getEmail()
    * def firstnameValue = dataGenerator.getFirstName()
    * def titleValue = dataGenerator.getTitle()
    * def lastNameValue = dataGenerator.getLastName()
    * def genderValue = dataGenerator.getGender()
    Given url apiUrl
    * def result = callonce read('TokenGenerator.feature')
    * def tokenValue = result.token

  @E2E
  Scenario Outline: E2E Testing
    Given headers {Authorization: '#("Bearer " + tokenValue)'}
    Given path '/user'
    When request
      """
      {
          "primaryPerson":{
              "email" : "<email>",
              "title":"<title>",
              "firstName":"<firstName>",
              "lastName":"<lastName>",
              "gender":"<gender>",
              "maritalStatus":"<maritalStatus>",
              "employmentStatus":"<employmentStatus>",
              "dateOfBirth":"<dateOfBirth>",
              "languagePref":"<languagePref>"
          },
          "primaryPersonMailingAddress":{
              "addressType":"<addressType>",
              "addressLine1":"<addressLine1>",
              "city":"<city>",
              "state":"<state>",
              "postalCode":"<postalCode>",
              "countryCode":"<countryCode>"
          },
          "primaryPersonPhone":{
              "phoneNumber":"<phoneNumber>",
              "phoneExtension":"<phoneExtension>",
              "phoneTime": "<phoneTime>",
              "phoneType":"<phoneType>"
      
          }
      
          
          }
      """
    And method post
    Then status 200
    And print response
    And match response.meta.code == 200
    And match response.meta.status == 'success'
    And match response.data.primaryPerson.email == '<email>'
    * def accountId = response.data.account.accountId
    * print accountId
    Given url apiUrl
    Given headers {Authorization: '#("Bearer " + tokenValue)'}
    Given path '/user/' + accountId
    When method get
    Then status 200
    And print response
    Given url apiUrl
    Given headers {Authorization: '#("Bearer " + tokenValue)'}
    Given path '/user/' + accountId
    When method delete
    Then status 200
    And print response
    And match response.data == 'Record successfuly deleted'

    Examples: 
      | email         | title         | firstName         | lastName         | gender         | maritalStatus | employmentStatus | dateOfBirth | languagePref | addressType | addressLine1 | city      | state | postalCode | countryCode | phoneNumber | phoneExtension | phoneTime | phoneType |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
      | #(emailValue) | #(titleValue) | #(firstnameValue) | #(lastNameValue) | #(genderValue) | Single        | student          | 1990-01-01  | CH           | China       | 123 No where | Hong Kong | China |      12345 |         002 |  1012023344 | none           | night     | mobile    |
