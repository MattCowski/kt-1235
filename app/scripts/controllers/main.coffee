'use strict'

angular.module('krisTileApp')
  .controller 'MainCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings
