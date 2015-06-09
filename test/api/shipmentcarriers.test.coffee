nock = require('nock')
should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
ShipmentCarriers = require('../../lib/api/shipmentcarriers')


describe 'ShipmentCarriers', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  shipmentCarriers = new ShipmentCarriers(host, authenticator, '')

  # Sandbox for Sinon spies
  sandbox = null

  beforeEach ->
    sandbox = sinon.sandbox.create()

  afterEach ->
    sandbox.restore()

  describe '#uri', ->
    it "returns '/shipmentcarriers' if given no id", ->
      shipmentCarriers.uri().should.equal('/shipmentcarriers')

    it "returns '/shipmentcarriers/:id' if given an id", ->
      shipmentCarriers.uri(456).should.equal('/shipmentcarriers/456')