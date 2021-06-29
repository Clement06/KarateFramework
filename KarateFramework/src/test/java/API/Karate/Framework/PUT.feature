Feature: PUT Request validation

  Background: 
    * url 'https://reqres.in/'
    * header Accept = 'application/json'
    * def expectedOutput = read('response2.json')

  Scenario: Create User Json and pass data from request.json file
    Given path '/api/users/2'
    And def requestBody = read('request2.json')
    And print requestBody
    And requestBody.name = 'Clement Antony Dass'
    And requestBody.job = 'Senior Software Engineer'
    And request requestBody
    When method put
    Then status 200
    And print responseStatus
    And print response

  Scenario: Update User and change request value dynamically
    Given path '/api/users/2'
    And request {"name": "Clement","job": "Automation Engineer"}
    When method put
    And print response
    Then status 200
    And print responseStatus
    And match response == expectedOutput
