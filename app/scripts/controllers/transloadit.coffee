'use strict'

angular.module('krisTileApp')
  .controller 'TransloaditCtrl', ($scope, $http, Transloadit) ->
    $http.get('/api/signature').success (signature) ->
      $scope.signature = signature
    # $http.get('/api/signature').success(callback)

    $scope.upload = (file) ->
      console.log "hit upload btn"
      Transloadit.upload file,
        console.log "Transloadit for "+file
        params:
          auth:
            key: "2629128085a911e3b3e3a539a6199a02"

          template_id: "00da5fa085ab11e3a7c56f69d855062b"

        signature: (callback) ->
          $http.get('/api/signature').success(callback)
          # ideally you would be generating this on the fly somewhere
          # callback "here-is-my-signature"

        progress: (loaded, total) ->
          console.log loaded + "bytes loaded"
          console.log total + " bytes total"

        processing: ->
          console.log "done uploading, started processing"

        uploaded: (assemblyJson) ->
          console.log assemblyJson

        error: (error) ->
          console.log error