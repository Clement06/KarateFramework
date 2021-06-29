Feature: Delete method Validation

Background:
    * url 'https://reqres.in/'
    * header Accept = 'application/json'
    
      Scenario: Delete the value
    Given path '/api/users/2'
    When method delete
    Then status 204
    And print responseStatus
    And print response