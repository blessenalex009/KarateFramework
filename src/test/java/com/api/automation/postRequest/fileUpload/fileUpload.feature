Feature: To upload file using karate framework

  Background: Set up the base path
    Given url 'http://localhost:9191'

    Scenario: To upload the file in the test application
      Given path '/normal/webapi/upload'
      # location of file, name of file, content-type header value
      And multipart file file = { read: 'FileToUpload.txt', filename: 'FileToUpload.txt', Content-type: 'multipart/form-data' }
      When method post
      Then status 200
      And print response
      And match response.message contains 'FileToUpload.txt'