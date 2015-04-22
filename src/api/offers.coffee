Documents = require('./documents')
Notes = require('./notes')
Resource = require('./resource')


class Offers extends Resource

  update: (offerId, data) ->
    headers = @authenticator.secureHeaders 'post', @uri(offerId)
    request 'post', { uri: @uri(offerId), headers: headers, body: JSON.stringify data }

  documents: (offerId) ->
    new Documents(@host, @authenticator, @uri(offerId))

  notes: (offerId) ->
    new Notes(@host, @authenticator, @uri(offerId))


module.exports = Offers
