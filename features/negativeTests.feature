Feature: API Tests including mocking and real request

@test @MockExampleBasic
Scenario Outline: This mock test will be used when music festival data api isnt ready
  When user mocks GET request <endPoint> to verify the response code <code>

Examples:
| endPoint                                                              | code  |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" | 429   |


@wip @pending
Scenario Outline:  User send multiple Get request for musical festival data to verify expected response code
  When user makes multiple GET request to get the music festival data using <endPoint>
  Then user verifies that the response status code should be 429

Examples:
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |

@wip @pending
Scenario Outline:  User send Get request for musical festival data to verify expected response code when service is unavailable
  When user makes a GET request to get the music festival data using <endPoint>
  Then user verifies that the response status code should be 404

Examples:
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |

@wip @pending
Scenario Outline:  User send Get request for musical festival data to verify expected response code when request is unauthorised
  When user makes a GET request to get the music festival data using <endPoint>
  Then user verifies that the response status code should be 401

Examples:
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |

@wip @pending
Scenario Outline:  User send Get request for musical festival data to verify expected response code when there is an internal server error (needs back-end settings)
  When user makes a GET request to get the music festival data using <endPoint>
  Then user verifies that the response status code should be 500

Examples:
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |

@wip @pending
Scenario Outline:  User send Get request for musical festival data to verify expected response code when there is a gateway timeout error (needs back-end settings)
  When user makes a GET request to get the music festival data using <endPoint>
  Then user verifies that the response status code should be 504

Examples:
| endPoint                                                              |
| "http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals" |


