'use strict'

angular.module('krisTileApp')
  .controller 'MessageCtrl', ($scope, $http) ->
    $http.get('/api/message').success (message) ->
      $scope.message = message