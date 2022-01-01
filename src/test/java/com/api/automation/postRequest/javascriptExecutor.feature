Feature: To execute the javascript function

  Scenario: Execute javascript function with and without parameter
    * def getIntValue = function() { return 10; }
    Then print "Function Value => ", getIntValue()
    * def getString = function(arg) { return "Hello " + arg; }
    Then print "Function Value => ", getString("Blessen")

