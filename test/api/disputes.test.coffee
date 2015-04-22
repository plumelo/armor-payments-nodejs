nock = require('nock')
should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Disputes = require('../../lib/api/disputes')


describe 'Disputes', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  disputes = new Disputes(host, authenticator, '/accounts/1234/orders/56')

  describe '#uri', ->
    it "returns '/accounts/:aid/orders/:oid/disputes' if given no id", ->
      disputes.uri().should.equal('/accounts/1234/orders/56/disputes')

    it "returns '/accounts/:aid/disputes/:dispute_id' if given an id", ->
      disputes.uri(78).should.equal('/accounts/1234/orders/56/disputes/78')
