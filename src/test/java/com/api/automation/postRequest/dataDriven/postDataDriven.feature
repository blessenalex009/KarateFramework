Feature: To create job description in test application

  Background: To read the data from csv file
    * def testData = read('examples.csv')

  Scenario Outline: To create job description in the test application
    Given print '<url>'
    Then print '<path>'
    When print '<method>'
    And print '<status>'

    Examples:
      | url                   | path               | method | status |
      | http://localhost:9191 | /normal/webapi/all | get    | 200    |
      | http://localhost:9191 | /normal/webapi/add | post   | 201    |

  Scenario Outline: Data Driven for the job description entry - <jobId>
    Given url 'http://localhost:9191'
    And path '/normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type:'application/json' }
    When method post
    And status <status>
    Examples:
      | jobId | jobTitle          | jobDescription                   | status |
      | 2     | "Software Engg 2" | "To develop andriod application" | 201    |
      | id    | "Software Engg 2" | "To develop andriod application" | 400    |
      | false | "Software Engg 2" | "To develop andriod application" | 400    |

  Scenario Outline: Data Driven for the job description using external file <jobId>
    Given url 'http://localhost:9191'
    And path '/normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type:'application/json' }
    When method post
    And status <status>
    Examples:
      | testData |