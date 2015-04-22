Documents = require('./documents')
Notes = require('./notes')
Offers = require('./offers')
Resource = require('./resource')


class Disputes extends Resource

  documents: (disputeId) ->
    new Documents(@host, @authenticator, @uri(disputeId))

  notes: (disputeId) ->
    new Notes(@host, @authenticator, @uri(disputeId))

  offers: (disputeId) ->
    new Offers(@host, @authenticator, @uri(disputeId))


module.exports = Disputes
