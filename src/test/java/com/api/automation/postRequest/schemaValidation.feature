Feature: Validate the json schema
  to validate the json schema for POST /normal/webapi/add

  Background: Create and initialize base url
    Given url 'http://localhost:9191'

  Scenario: To validate the json schema
    Given path '/normal/webapi/add'
    And request {"jobId":2,"jobTitle":"Software Engg 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type:'application/json' }
    When method post
    And status 201
    And match response ==
    """
  {
  "jobId": '#number',
  "jobTitle": "#string",
  "jobDescription": "#string",
  "experience": '#[] #string',
  "project": '#[] #object'
  }
    """

  Scenario: Schema Validation for get end point
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get  #send the get request
    Then status 200  #the response should be status 200
    * def projectSchema = {"projectName": '#string', "technology": '#[] #string'}
    * def mainSchema = {"jobId": '#number', "jobTitle": '#string', "jobDescription": '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
    And match response ==
    """
    '#[] ##(mainSchema)'
    """
