Feature: To test the get end points of the application

  Background: Set the base path
    Given url 'http://localhost:9191'
    And print '==========This is the background keyword========='

  Scenario: To get all the data from the application in json format
    #Given url 'http://localhost:9191/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method get  #send the get request
    Then status 200  #the response should be status 200



  Scenario: To get all the data from the application in json format
    Given url 'http://localhost:9191'
    And path '/normal/webapi/all'
    And header Accept = 'application/json' 
    When method get  #send the get request
    Then status 200  #the response should be status 200
    
    
    
    
    
    
    
    
    
