Feature: Karate-Config Demo feature

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Validating the Karate-config.js config- name
    Given print name

  Scenario: validating Karate-config.js base url
    Given path '/api/users/2'
    When method delete
    Then status 204
    And print responseStatus
    And print response
