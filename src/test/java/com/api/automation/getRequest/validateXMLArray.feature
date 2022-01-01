Feature: To validate the get end points
  To validate the get end point response

  Background: Set the base path
    Given url 'http://localhost:9191'

  Scenario: To get the data in xml format and validate using fuzzy matchers
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '#notnull	'
      And match response/List/item/jobTitle == '#string	'
    And match response/List/item/experience == '#array'
   

  Scenario: To get the data in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/experience/experience[2] == 'Apple'
    #traverse xml similar to json
    And match response.List.item.experience.experience[1] == 'Apple'
