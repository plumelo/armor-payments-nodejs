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
