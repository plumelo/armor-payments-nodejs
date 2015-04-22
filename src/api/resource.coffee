request = require('request-promise')


class Resource
  constructor: (@host, @authenticator, @uriRoot) ->
    @client = request.defaults(
      baseUrl: @host
      headers: { 'Accept': 'application/json' }
      resolveWithFullResponse: true
    )

  resourceName: ->
    @constructor.name.toLowerCase()

  uri: (objectId = null) ->
    base = "#{@uriRoot}/#{@resourceName()}"
    base += "/#{objectId}" if objectId
    base

  request: (method, params) ->
    @client[method](params)
      .then (response) ->
        if response.headers['content-type']?.match /json/i
          # If possible, parse the JSON
          response.body = JSON.parse response.body
        response

  all: ->
    headers = @authenticator.secureHeaders 'get', @uri()
    @request 'get', { uri: @uri(), headers: headers }

  get: (objectId) ->
    headers = @authenticator.secureHeaders 'get', @uri(objectId)
    @request 'get', { uri: @uri(objectId), headers: headers }


module.exports = Resource
