'use strict'

describe 'Controller: MessageCtrl', () ->

  # load the controller's module
  beforeEach module 'krisTileApp'

  MessageCtrl = {}
  scope = {}
  $httpBackend = {}

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/awesomeThings').respond ['HTML5 Boilerplate', 'AngularJS', 'Karma', 'Express']
    scope = $rootScope.$new()
    MessageCtrl = $controller 'MessageCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings).toBeUndefined()
    $httpBackend.flush()
    expect(scope.awesomeThings.length).toBe 4
