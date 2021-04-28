Feature: API Tests including mocking and real request

@test @MockExampleBasic
Scenario Outline: This mock test will be used when music festival data api isnt ready
  When user mocks GET request <endPoint> to verify the response code <code>

Examples:
| endPoint                                                              | code  |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" | 200   |

@test
Scenario Outline:  User request for musical festival data to verify data correctness
  When user makes a GET request for the first time using <endPoint>
  Then user verifies that the response status code should be 200
  #Example to show the alphabetcal order verification (need to be optimised)
  Then response name is sorted in alphabetical order

Examples:
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |

#As the response code turns to 429 in multiple request, hence one test is prepared (unless api can be tweaked to handle multiple request in test env?!)
@wip @pending
Scenario Outline:  Get the response data to verify the data is structured as expected for the music festival
  When user makes a GET request for the first time using <endPoint>
  Then user verifies that the response status code should be 200
  #Following steps might need access to back-end (database query or other) to get the list of expected dataset in chrono order to cross-verify the response data
  And verifies that all expected band record label are returned at the top and are sorted in alphabetical order
  And verifies that all expected band names are returned under respective record labels and are sorted in alphabetical order
  And verifies that all expected festivals attended by respective bands are returned and are sorted in alphabetical order
Examples:
#http://eacodingtest.digital.energyaustralia.com.au can be in env file
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |
