should = require('chai').should()
sinon = require('sinon')
Authenticator = require('../../lib').Authenticator
Accounts = require('../../lib/api/accounts')


describe 'Accounts', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  accounts = new Accounts(host, authenticator, '')

  describe '#uri', ->
    it 'returns '/accounts' if given no id', ->
      accounts.uri.should.equal('/accounts')

    it 'returns '/accounts/:id' if given an id', ->
      accounts.uri(456).should.equal('/accounts/456')

  describe '#create', ->

    it 'makes POST with /accounts and JSONified data', ->
      accounts.should_receive('request').with('post', hash_including(path: '/accounts', body: '{"name":"Bobby Lee"}'))
      accounts.create({ 'name' => 'Bobby Lee'})
