Feature: To create the job entry in the application
  Use POST http://localhost:9191/normal/webapi/add to create job entry in the application

  Background: Create and initialize base url
    Given url 'http://localhost:9191'

  Scenario: To create job entry in json format
    Given path '/normal/webapi/add'
    And request {"jobId":2,"jobTitle":"Software Engg 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type:'application/json' }
    When method post
    And status 201
    And print response
    And match response.jobId == 2

  Scenario: To create job entry in json format using external file
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept: 'application/json', Content-Type:'application/json' }
    When method post
    And status 201
    And match response.jobId == 6

  Scenario: To create job entry in json format using embedded expressions
    Given path '/normal/webapi/add'
    * def jobId = function(){return Math.floor((100) * Math.random()); }
    * def jobTitle = "Software Engg 10"
    And request {"jobId":#(jobId()),"jobTitle":#(jobTitle),"jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type:'application/json' }
    When method post
    And status 201
    And print response