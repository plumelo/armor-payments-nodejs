should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Users = require('../../lib/api/users')


describe 'Users', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  users = new Users(host, authenticator, '/accounts/1234')

  describe '#uri', ->
    it "returns '/users' if given no id", ->
      users.uri().should.equal('/accounts/1234/users')

    it "returns '/users/:id' if given an id", ->
      users.uri(456).should.equal('/accounts/1234/users/456')
