Feature: GET Request Validations
   Background:
      * url 'https://restcountries.eu'
      * header Accept = 'application/json'
      * def expectedOutput = read('response.json')
   Scenario: Get list of all countries
      Given path '/rest/v2/all'
      When method GET
      Then status 200
      And print responseStatus
      And print response
      And match response[*].name contains 'Afghanistan'
      And match response[0].callingCodes contains '93'
      And match response[0].altSpellings[0] contains 'AF'
      And match response == expectedOutput
 
      
      