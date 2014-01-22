'use strict'

angular.module('krisTileApp')
  .factory 'Session', ($resource) ->
    $resource '/api/session/'
