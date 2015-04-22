class Resource
  constructor: (@host, @authenticator, @uriRoot) ->

  connection: ->
    @connection ||= request.defaults(baseUrl: host, headers: { 'Accept': 'application/json' })

  resourceName: ->
    @constructor.name.toLowerCase()

  uri: (objectId = null) ->
    base = "#{@uriRoot}/#{@resourceName()}"
    base += "/#{objectId}" if objectId
    base

  # If possible, parse the JSON
  request: (method, params) ->
    response = @connection[method](params)
    if response.getHeader('Content-Type').match /json/i
      response.body = JSON.parse response.body
    response

  all: ->
    headers = @authenticator.secureHeaders 'get', uri
    @request 'get', { path: uri, headers: headers }

  get: (objectId) ->
    headers = @authenticator.secureHeaders 'get', uri(objectId)
    @request 'get', { path: @uri(objectId), headers: headers }


module.exports = Resource
