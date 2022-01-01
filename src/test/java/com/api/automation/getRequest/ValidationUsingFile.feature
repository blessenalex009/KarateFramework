Feature: To validate the get end points
  To validate the get end point response

  Background: Set the base path
    Given url 'http://localhost:9191'

  Scenario: To get the data in json format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    #create a variable to store data from external file
    * def actualResponse = read("../JsonResponse.json")
    And match response == actualResponse
    And print "File ==> ", actualResponse