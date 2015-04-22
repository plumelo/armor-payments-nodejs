crypto = require('crypto')


class Authenticator

  constructor: (@apiKey, @apiSecret) ->

  secureHeaders: (method, uri) ->
    'X-ARMORPAYMENTS-APIKEY': @apiKey
    'X-ARMORPAYMENTS-REQUESTTIMESTAMP': @currentTimestamp()
    'X-ARMORPAYMENTS-SIGNATURE': @requestSignature method, uri

  currentTimestamp: ->
    # Return ISO8601 format without the fractional part
    (new Date).toISOString().replace(/\.[0-9]+/, '')

  requestSignature: (method, uri) ->
    hash = crypto.createHash 'sha512'
    hash.update "#{@apiSecret}:#{method.toUpperCase()}:#{uri}:#{@currentTimestamp()}"
    hash.digest('hex')


module.exports = Authenticator
