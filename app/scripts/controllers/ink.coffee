'use strict'

angular.module('krisTileApp')
  .controller 'InkCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings


  .value "infowrapFilepicker.config",
    apiKey: "AP5SGUg4hQSyphIh83GbJz"
    iframeContainer: "filepicker-modal-container"
    isMobile: false
    loadProtocol: "https:"
    debugLogging: true
    useSecurity: false
    signApiUrl: (resourceId) ->
      "http://yourserver.com/wraps/" + resourceId + "/file_assets/sign.json"

    pickOptions:
      debug: false
      # container: "filepicker-modal"
      # maxSize: 2000 * 1024 * 1024
      services: ["COMPUTER", "FACEBOOK", "DROPBOX", "BOX", "GMAIL", "GOOGLE_DRIVE", "IMAGE_SEARCH", "URL", "INSTAGRAM", "EVERNOTE", "FLICKR", "FTP", "GITHUB", "PICASA", "WEBCAM", "WEBDAV"]

  # .run ($rootScope, infowrapFilepickerService) ->
  #   $rootScope.modalClose = ->
  #     $rootScope.$broadcast infowrapFilepickerService.events.modal.close

  #   $rootScope.$on infowrapFilepickerService.events.pickedFiles, (e, files) ->
  #     $rootScope.files = files
  #     for file in files
  #       console.log "A FILE!!!!"
  #       inkblob = file
  #       filepicker.convert inkblob, {width: 300, height: 300}, (new_InkBlob) ->
  #         console.log new_InkBlob
  #         $rootScope.newFile = new_InkBlob
  
  
          # https://developers.inkfilepicker.com/docs/web/#convert
          # filepicker.convert(InkBlob, conversion_options, storage_options, onSuccess(InkBlob){}, onError(FPError){}, onProgress(percent){})
          # {crop: [20, 20, 100, 100]}
          # {access: 'public'}
          # {container: 'user-photos'}
#           {fit: 'clip'}
# Specifies how to resize the image. Possible values are:

# 'clip': Resizes the image to fit within the specified parameters without distorting, cropping, or changing the aspect ratio
# 'crop': Resizes the image to fit the specified parameters exactly by removing any parts of the image that don't fit within the boundaries
# 'scale': Resizes the image to fit the specified parameters exactly by scaling the image to the desired size
# 'max': Resizes the image to fit within the parameters, but as opposed to 'clip' will not scale the image if the image is smaller than the output size


# file = {"url":"https://www.filepicker.io/api/file/HrsOtmRHGz7oC5gsFPkw","filename":"Kitchen Backsplash Space.jpg","mimetype":"image/jpeg","size":65027,"key":"UWZeJDrSFuv2cxElahdQ_Kitchen Backsplash Space.jpg","container":"uploads44","isWriteable":true}
# var inkblob = { url: 'https://www.filepicker.io/api/file/H7KYuWy1S3e1qvG2M66i',
#     filename: 'customers.jpg', mimetype: 'image/jpeg', isWriteable: false, size: 629454};
# console.log("Converting...");
# /*an <img> element where we can display the resulting image*/
# var result = document.getElementById("convert-result");
# filepicker.convert(inkblob, {width: 200, height: 200},
#     function(new_InkBlob){
#         console.log(new_InkBlob.url);
#         result.src = new_InkBlob.url;
#     }
# );

