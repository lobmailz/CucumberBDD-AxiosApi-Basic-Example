const {
  Given,
  When,
  Then,And
} = require('cucumber');
const axios = require('axios');
var expect = require('expect');
const MockAdapter = require("axios-mock-adapter");
const _ = require("lodash");
let getResponse;
let expectedSortedOrder = undefined;
let responseData = undefined;

When(/user mocks GET request (.*) to verify the response code (.*)/, async function (url, code) {
  const mockAxios = new MockAdapter(axios);
  mockAxios
    .onGet(url)
    .reply(code, { status: 'valid', reason: 'Connected.' });
});


When(/^user makes a GET request for the first time using "([^"]*)"/, async function (url) {
  var headers= {
    'Content-Type': 'application/json'
  }
  //Can be a reusable
  getResponse= await axios.get(url,{headers:headers}).then(function(response){
    responseData = response.data;
   // console.log(response.data)
    return response;
  }).catch(function(response)
  {  
    return response.response;
  });
});

When(/^user makes multiple GET request to get the music festival data using "([^"]*)"/, async function (url) {
  var headers= {
    'Content-Type': 'application/json'
  }
  for(var i=0;i<2; i++){
    getResponse= await axios.get(url,{headers:headers}).then(function(response){
      responseData = response.data;
      return response;
    }
  ).catch(function(response)
  {  
    return response.response;
  });
  }
});

Then('response name is sorted in alphabetical order', async function () {
  expectedSortedOrder = _.orderBy(responseData, ['name'],['asc']);
  expect(responseData).toEqual(expectedSortedOrder);
});

Then('user verifies that the response status code should be {int}', async function (status) {
  expect (await getResponse.status).toEqual(status)
});