Feature: Variable creation in Karate Framework

# <Gherkin Keyword> <def> <Variable_name> = <Value>
# * <def> <Variable_name> = <Value>

Background: create and initialize variable
* def app_name = "Google"


Scenario: To create a variable
# Use variable for repeating value
#Storing the data from a external file
#In the matcher expression
#Passing the data from one feature file to another

Given def var_int = 10
And def var_string = "Karate"
Then print "Int Variable ==> ", var_int
And print "String Variable ==> ", var_string
* def var_string2 = "Karate2"
And print "String Variable ==> ", var_string2
And print "GLobal var ==> ", app_name

