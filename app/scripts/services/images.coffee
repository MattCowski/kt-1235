'use strict'

angular.module('krisTileApp')
  .factory 'Images', ($firebase, fbURL) ->
    $firebase(new Firebase(fbURL + '/images'))