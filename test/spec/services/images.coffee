'use strict'

describe 'Service: Images', () ->

  # load the service's module
  beforeEach module 'krisTileApp'

  # instantiate service
  Images = {}
  beforeEach inject (_Images_) ->
    Images = _Images_

  it 'should do something', () ->
    expect(!!Images).toBe true
