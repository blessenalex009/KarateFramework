Feature: To use json Path expression

  Background: Set the base path
    Given url 'http://localhost:9191'

    Scenario: To get value of property using json path expression
      Given path '/normal/webapi/all'
      When method get
      Then status 200
      # Karate.jsonPath(doc, jsonPathExpression)
      * def jobTitle = karate.jsonPath(response, "$[?(@.jobId == 1)].jobTitle")
      * def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription")
      * def experience = karate.jsonPath(response, "$[?(@.jobId == 1)].experience")
      And print "jobTitle => ",jobTitle
      And print "jobDescription => ",jobDescription
      And print "experience => ",experience

