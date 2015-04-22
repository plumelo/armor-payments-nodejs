nock = require('nock')
should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Offers = require('../../lib/api/offers')

describe 'Offers', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  offers = new Offers(host, authenticator, '/accounts/1234')

  # Sandbox for Sinon spies
  sandbox = null

  beforeEach ->
    sandbox = sinon.sandbox.create()

  afterEach ->
    sandbox.restore()

  describe '#update', ->
    it 'makes POST with the right uri and JSONified data', (done) ->
      nock('https://sandbox.armorpayments.com')
        .post('/accounts/1234/offers/90')
        .reply(201)
      spy = sandbox.spy(offers, 'request')

      offers.update(90, {'name': 'Bobby Lee'})
        .then (response) ->
          callargs = spy.getCall(0).args
          callargs[0].should.equal('post')
          callargs[1].should.include(
            uri: '/accounts/1234/offers/90'
            body: '{"name":"Bobby Lee"}'
          )
          done()
