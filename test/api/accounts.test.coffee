nock = require('nock')
should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Accounts = require('../../lib/api/accounts')


describe 'Accounts', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  accounts = new Accounts(host, authenticator, '')

  # Sandbox for Sinon spies
  sandbox = null

  beforeEach ->
    sandbox = sinon.sandbox.create()

  afterEach ->
    sandbox.restore()

  describe '#uri', ->
    it "returns '/accounts' if given no id", ->
      accounts.uri().should.equal('/accounts')

    it "returns '/accounts/:id' if given an id", ->
      accounts.uri(456).should.equal('/accounts/456')

  describe '#create', ->

    it 'makes POST with /accounts and JSONified data', (done) ->
      nock('https://sandbox.armorpayments.com')
        .post('/accounts')
        .reply(201)
      spy = sandbox.spy(accounts, 'request')

      accounts.create({'name': 'Bobby Lee'})
        .then (response) ->
          callargs = spy.getCall(0).args
          callargs[0].should.equal('post')
          callargs[1].should.include(
            uri: '/accounts'
            body: '{"name":"Bobby Lee"}'
          )
          done()
