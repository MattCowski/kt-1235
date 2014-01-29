'use strict'

angular.module('krisTileApp')
  .controller 'FileuploadCtrl', ($scope, $http, $upload, Transloadit) ->
    
    # $scope.onFileSelect = ($files) ->
    #   i = 0

    #   while i < $files.length
    #     file = $files[i]
    #     Transloadit.upload file
    #     i++
    $scope.onFileSelect = ($files) ->
      
      #$files: an array of files selected, each file has name, size, and type.
      i = 0

      while i < $files.length
        file = $files[i]
        Transloadit.upload file,
          # console.log "Transloadit for "+file
          params:
            auth:
              key: "2629128085a911e3b3e3a539a6199a02"

            template_id: "00da5fa085ab11e3a7c56f69d855062b"

          signature: (callback) ->
            $http.get('/api/signature').success(callback)
            $http.get('/api/signature').success (signature) ->
              $scope.signature = signature
            # ideally you would be generating this on the fly somewhere
            # callback "here-is-my-signature"
            console.log "sig passed"

          progress: (loaded, total) ->
            console.log loaded + "bytes loaded"
            console.log total + " bytes total"

          processing: ->
            console.log "done uploading, started processing"

          uploaded: (assemblyJson) ->
            console.log assemblyJson

          error: (error) ->
            console.log error
        i++


        #upload.php script, node.js route, or servlet url
        # method: POST or PUT,
        # headers: {'headerKey': 'headerValue'}, withCredential: true,
        
        # file: $files, //upload multiple files, this feature only works in HTML5 FromData browsers
        # set file formData name for 'Content-Desposition' header. Default: 'file' 
        
        #fileFormDataName: myFile, //OR for HTML5 multiple upload only a list: ['name1', 'name2', ...]
        # customize how data is added to formData. See #40#issuecomment-28612000 for example 
        
        #formDataAppender: function(formData, key, val){} 

        # $scope.upload = $upload.upload(
        #   url: "server/upload/url"
        #   data:
        #     myObj: $scope.myModelObj

        #   file: file
        # ).progress((evt) ->
        #   console.log "percent: " + parseInt(100.0 * evt.loaded / evt.total)
        # ).success((data, status, headers, config) ->
          
        #   # file is uploaded successfully
        #   console.log data
        # )
        # i++

  #.error(...)
#.then(success, error, progress); 

    # $scope.onFileSelect = ($files) ->
    #   console.log $files
    #   #$files: an array of files selected, each file has name, size, and type.
    #   i = 0

    #   while i < $files.length
    #     file = $files[i]
    #     console.log file
    #     #upload.php script, node.js route, or servlet url
    #     # method: POST or PUT,
    #     # headers: {'headerKey': 'headerValue'}, withCredential: true,
        
    #     # file: $files, //upload multiple files, this feature only works in HTML5 FromData browsers
    #     # set file formData name for 'Content-Desposition' header. Default: 'file' 
        
    #     #fileFormDataName: myFile, //OR for HTML5 multiple upload only a list: ['name1', 'name2', ...]
    #     # customize how data is added to formData. See #40#issuecomment-28612000 for example 
        
    #     #formDataAppender: function(formData, key, val){} 

    #     # start transloadit code:
    #     $scope.upload = (file) ->
    #       console.log "hit upload btn"
    #       Transloadit.upload file,
    #         params:
    #           auth:
    #             key: "2629128085a911e3b3e3a539a6199a02"

    #           template_id: "00da5fa085ab11e3a7c56f69d855062b"

    #         signature: (callback) ->
    #           $http.get('/api/signature').success(callback)
    #           # ideally you would be generating this on the fly somewhere
    #           # callback "here-is-my-signature"
    #         console.log signature

    #         progress: (loaded, total) ->
    #           console.log loaded + "bytes loaded"
    #           console.log total + " bytes total"

    #         processing: ->
    #           console.log "done uploading, started processing"

    #         uploaded: (assemblyJson) ->
    #           console.log assemblyJson

    #         error: (error) ->
    #           console.log error
    #           # end of transloadit code.

        # $scope.upload = $upload.upload(
        #   url: "server/upload/url"
        #   data:
        #     myObj: $scope.myModelObj

        #   file: file
        # ).progress((evt) ->
        #   console.log "percent: " + parseInt(100.0 * evt.loaded / evt.total)
        # ).success((data, status, headers, config) ->
          
        #   # file is uploaded successfully
        #   console.log data
        # )
        # i++

  # .error(...)
  # .then(success, error, progress); 

    # $scope.onFileSelect = ($files) ->
    #   i = 0

    #   while i < $files.length
    #     $file = $files[i]
    #     AWS.get
    #       partId: $stateParams.id
    #       bucket: ""
    #     , ((response) ->
    #       formData =
    #         key: "/OEM/PARTS/" + $stateParams.id + "/" + $file.name
    #         AWSAccessKeyId: "AKIAIVZXXCPQ5A3OXM3A"
    #         acl: "private"
    #         success_action_redirect: "#"
    #         policy: response.policy
    #         signature: response.signature
    #         "Content-Type": $file.type

          
    #       #this clears the default Authorization code.
    #       $http.uploadFile(
    #         method: "POST"
    #         url: "https://kristilecom.s3.amazonaws.com/"
    #         headers:
    #           "Content-Type": "multipart/form-data"
    #           Authorization: ""

    #         data: formData
    #         file: $file
    #       ).progress((evt) ->
    #         console.log "percent: " + parseInt(100.0 * evt.loaded / evt.total)
    #       ).then (data, status, headers, config) ->
            
    #         # file is uploaded successfully
    #         console.log data

    #     ), ->
    #       alert "failed to download policy file"

    #     i++