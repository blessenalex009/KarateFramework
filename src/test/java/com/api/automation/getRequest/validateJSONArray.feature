Feature: To validate the get end points
  To validate the get end point response

  Background: Set the base path
    Given url 'http://localhost:9191'

  Scenario: To get the data in json format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].technology[2] == "Gradle"
    #to validate the size of the array
    And match response.[0].project[0].technology == '#[3]'
    # using wild card character
    And match response.[0].project[0].technology[*] ==  ["Kotlin","SQL Lite","Gradle"]
    #contains keyword
    And match response.[0].project[0].technology[*] contains  ["Gradle"]

  Scenario: To get the data in json format and validate using fuzzy matchers
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == '#present'
    And match response.[0].experience[1] == '#ignore'
    And match response.[0].project[0].technology == "#array"
    And match response.[0].jobTitle == "#string"
    And match response.[0].jobId == '#number'
    #Complex fuzzy matchers
    And match response.[0].jobId == '#? _ == 1'
    And match response.[0].jobTitle == '#string? _.length >= 1'
    #to validate the array
    And match response.[0].project[0].technology == '#[]'
    And match response.[0].project[0].technology == '#[3]'
    #to make sure it is an array of strings
    And match response.[0].project[0].technology == '#[3] #string? _.length >=2'
