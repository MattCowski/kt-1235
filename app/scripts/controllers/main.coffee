'use strict'

angular.module('krisTileApp')
  .controller 'MainCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings

    $scope.cloudinaryData = { 
      "eager": "c_fill,h_100,w_150|e_sharpen",
      "transformation": "c_limit,h_1000,w_1000",
      "tags": "directly_uploaded,user_uploaded",

      "api_key": "467799287163396",
      "callback": "https://www.example.com/cloudinary_cors.html",
      "timestamp": 1372419182,
      "signature": "f5caf4b413d9f9a0008ba4dd42ae04eabcdb9f74"
    }