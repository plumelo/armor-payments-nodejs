nock = require('nock')
should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Orders = require('../../lib/api/orders')


describe "Orders", ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  orders = new Orders(host, authenticator, '/accounts/1234')

  # Sandbox for Sinon spies
  sandbox = null

  beforeEach ->
    sandbox = sinon.sandbox.create()

  afterEach ->
    sandbox.restore()

  describe "#uri", ->
    it "returns '/accounts/:aid/orders' if given no id", ->
      orders.uri().should.equal('/accounts/1234/orders')

    it "returns '/accounts/:aid/orders/:order_id' if given an id", ->
      orders.uri(456).should.equal('/accounts/1234/orders/456')

  describe "#update", ->
    it "makes POST with the right uri and JSONified data", (done) ->
      nock('https://sandbox.armorpayments.com')
        .post('/accounts/1234/orders/90')
        .reply(201)
      spy = sandbox.spy(orders, 'request')

      orders.update(90, {'name': 'Bobby Lee'})
        .then (response) ->
          callargs = spy.getCall(0).args
          callargs[0].should.equal('post')
          callargs[1].should.include(
            uri: '/accounts/1234/orders/90'
            body: '{"name":"Bobby Lee"}'
          )
          done()
