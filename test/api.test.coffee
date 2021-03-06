should = require('chai').should()
sinon = require('sinon')
API = require('../lib').API


describe 'API', ->
  client =  new API('my-key', 'my-secret', true)

  describe '#armorHost', ->
    context 'in sandbox mode', ->
      it 'returns https://sandbox.armorpayments.com', ->
        client.sandbox.should.be.true
        client.armorHost().should.equal('https://sandbox.armorpayments.com')

    context '*not* in sandbox mode', ->
      it 'returns https://api.armorpayments.com', ->
        client.sandbox = false
        client.armorHost().should.equal('https://api.armorpayments.com')

  describe "#subresources", ->
    describe "shipmentcarriers", ->
      it "can retrieve the shipment carriers resource", ->
        client.shipmentcarriers().should.be.an.object
        client.shipmentcarriers().all.should.be.a.function

    describe "users", ->
      it "can retrieve the users resource", ->
        client.users(1234).should.be.an.object
        client.users(1234).all.should.be.a.function

    describe "orders", ->
      it "can retrieve the orders resource", ->
        client.orders(1234).should.be.an.object
        client.orders(1234).all.should.be.a.function

    describe "accounts", ->
      it "can retrieve the accounts resource", ->
        client.accounts().should.be.an.object
        client.accounts().all.should.be.a.function
