'use strict'

angular.module('krisTileApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'angularFileUpload',
  'ngRoute',
  'infowrapFilepicker',
  'firebase',
  'ng-transloadit'
])
  .config ($routeProvider, $locationProvider, $httpProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'MainCtrl'
      
      .when '/login',
        templateUrl: 'partials/login'
        controller: 'LoginCtrl'
      .when '/signup', 
        templateUrl: 'partials/signup'
        controller: 'SignupCtrl'
      .when '/settings',
        templateUrl: 'partials/settings'
        controller: 'SettingsCtrl'
        authenticate: true
      .when '/fileUpload',
        templateUrl: 'partials/fileupload'
        controller: 'FileuploadCtrl'
      .when '/transloadit',
        templateUrl: 'partials/transloadit'
        controller: 'TransloaditCtrl'
      .when '/message',
        templateUrl: 'partials/message'
        controller: 'MessageCtrl'
      .when '/ink',
        templateUrl: 'partials/ink'
        controller: 'InkCtrl'
      .when '/gallery',
        templateUrl: 'partials/gallery'
        controller: 'GalleryCtrl'
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true
  
    $httpProvider.interceptors.push ['$q', '$location', ($q, $location) ->
      responseError: (response) ->
        if response.status is 401 or response.status is 403
          $location.path '/login'
          $q.reject response
        else
          $q.reject response
    ]
  .run ($rootScope, $location, Auth) ->
    
    # Redirect to login if route requires auth and you're not logged in
    $rootScope.$on '$routeChangeStart', (event, next) ->
      $location.path '/login'  if next.authenticate and not Auth.isLoggedIn()