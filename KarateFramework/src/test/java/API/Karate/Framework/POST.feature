Feature: POST Request Validations

  Background: 
    * url 'https://reqres.in/'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  Scenario: Create User Json and pass data from request.json file
    Given path '/api/users'
    And def requestBody = read('request1.json')
    And request requestBody
    When method post
    Then status 201
    And print responseStatus
    And print response

  Scenario: Create User Clement and pass in request itself
    Given path '/api/users'
    And request {"name": "Clement","job": "Automation Engineer"}
    When method post
    Then status 201
    And print responseStatus
    And print response
    And match $ == expectedOutput

  Scenario: Create User Json and give dynamic path
    Given path '/api/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'src/test/java/API/Karate/Framework/request.json'
    And def requestBody = filePath
    And print requestBody
    When method post
    Then status 201
    And print responseStatus
    And print response

  Scenario: Create User and change request value dynamically
    Given path '/api/users'
    And def requestBody = read('request1.json')
    And request requestBody
    And set requestBody.name = 'Clement'
    When method post
    Then status 201
    And print responseStatus
    And print response
    And match $ == expectedOutput
