'use strict'

angular.module('krisTileApp')
  .controller 'GalleryCtrl', ($scope, $firebase, Images, fbURL, $timeout) ->
    console.log "start"
    $scope.images = Images
    $scope.amazon = "https://s3-us-west-2.amazonaws.com/"
    # $scope.save = () ->
    #   Images.$add $scope.newImage
    #   $scope.newImage = ""
    $scope.remove = (id) ->
      console.log id
      Images.$remove(id)

    $scope.attachNote = (id, note) ->
      console.log Images[id].note = note
      Images.$save(id)
    $scope.test = () ->
      slow = () -> 
        console.log "converting very slowly ...."
      $timeout(slow)
      console.log "END OF SCRIPT!!! (should be at end)"


  .run ($rootScope, infowrapFilepickerService, Images, $timeout) ->
    $rootScope.modalClose = ->
      $rootScope.$broadcast infowrapFilepickerService.events.modal.close

    $rootScope.$on infowrapFilepickerService.events.pickedFiles, (e, originals) ->
      angular.forEach originals, ((original) ->
        $rootScope.newImage = {}
        $rootScope.newImage.original = original
        filepicker.convert original, {width: 580, height: 200, fit: 'crop', quality: 100}, {access: 'public'}, (thumb) ->
          $rootScope.newImage.thumb = thumb
          $timeout ->
            console.log Images.$add $rootScope.newImage
            $rootScope.newImage = ""
      )
# is to create a function like
# foo (list, listItem)
# inside the function
# if list is empty, return;
# else
# do blah blah, then inside of the asynchronus function
# use like shift() or pop() or remove() whatever works to remove the first item
# from list
# then recursively call foo (list, list[0])

# foo(list, listItem) ->
#   if list is ""
#     doNothing()
#   else
#     doBlah()
        


      # convert = (blob) ->
      #   # step 4
      #   # step 6
      #   filepicker.convert blob, {width: 580, height: 200, fit: 'crop', quality: 100}, {access: 'public'}, (thumb) ->
      #     $rootScope.newImage.thumb = thumb
      #     $timeout (->
      #       # add to Images
      #       # step 7 9
      #       console.log Images.$add $rootScope.newImage
      #       # step 8 10
      #       $rootScope.newImage = ""
      #     )

      # for original in originals
      #   $timeout ->
      #     # step1 and 2
      #     $rootScope.newImage = {}
      #     $rootScope.newImage.original = original
      #     $timeout (->
      #       # step 3
      #       # step 5
      #       convert original
      #     )


        # $scope.save = ->
        #   Projects.$add $scope.project, ->
        #     $timeout ->
        #       $location.path "/"


        # console.log "itterating..."
        # $rootScope.newImage = {}
        # $rootScope.newImage.original = original
        # filepicker.convert original, {width: 580, height: 200, fit: 'crop', quality: 100}, {access: 'public'}, (thumb) ->
        #   $rootScope.newImage.thumb = thumb
        #   Images.$add $rootScope.newImage, () ->
        #     $timeout( $rootScope.newImage = "")

        # countUp = () ->
        #   console.log original
        #   $timeout(countUp, 5000)

        #        $scope.save = function() {
        #           Projects.$add($scope.project, function() {
        #             $timeout(function() { $location.path('/'); });
        #           });
        #         };


# var original, _i, _len;

# for (_i = 0, _len = originals.length; _i < _len; _i++) {
#   original = originals[_i];
#   $rootScope.newImage = {};
#   $rootScope.newImage.original = original;
#   filepicker.convert(original, {
#     width: 580,
#     height: 200,
#     fit: 'crop',
#     quality: 100
#   }, {
#     access: 'public'
#   }, function(thumb) {
#     $rootScope.newImage.thumb = thumb;
#     Images.$add($rootScope.newImage);
#     return $rootScope.newImage = "";
#   });
# }




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

