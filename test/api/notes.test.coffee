nock = require('nock')
should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Notes = require('../../lib/api/notes')

describe "Notes", ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  notes = new Notes(host, authenticator, '/accounts/123/orders/456')

  # Sandbox for Sinon spies
  sandbox = null

  beforeEach ->
    sandbox = sinon.sandbox.create()

  afterEach ->
    sandbox.restore()

  describe "#create", ->

    it "makes POST with the right uri and JSONified data", (done) ->
      nock('https://sandbox.armorpayments.com')
        .post('/accounts/123/orders/456/notes')
        .reply(201)
      spy = sandbox.spy(notes, 'request')

      notes.create({'name': 'Bobby Lee'})
        .then (response) ->
          callargs = spy.getCall(0).args
          callargs[0].should.equal('post')
          callargs[1].should.include(
            uri: '/accounts/123/orders/456/notes'
            body: '{"name":"Bobby Lee"}'
          )
          done()
