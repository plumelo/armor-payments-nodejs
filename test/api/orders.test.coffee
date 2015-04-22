should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Orders = require('../../lib/api/orders')


describe Orders, ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  orders = new Orders(host, authenticator, '/accounts/1234')

  describe "#uri", ->
    it "returns '/accounts/:aid/orders' if given no id", ->
      orders.uri.should.equal('/accounts/1234/orders')

    it "returns '/accounts/:aid/orders/:order_id' if given an id", ->
      orders.uri(456).should.equal('/accounts/1234/orders/456')

  describe "#update", ->
    it "makes POST with the right uri and JSONified data", ->
      orders.should_receive('request').with(
        'post',
        hash_including(path: '/accounts/1234/orders/90', body: '{"name":"Bobby Lee"}')
      )
      orders.update(90, { 'name': 'Bobby Lee'})
