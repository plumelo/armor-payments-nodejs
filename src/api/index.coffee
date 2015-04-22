crypto = require('crypto')

Accounts = require('./accounts')
Orders = require('./orders')
Users = require('./users')
Authenticator = require('../authenticator')


class API

  constructor: (apiKey, apiSecret, @sandbox = false) ->
    @authenticator = new Authenticator(apiKey, apiSecret)

  armorHost: ->
    "https://#{if @sandbox then 'sandbox' else 'api'}.armorpayments.com"

  accounts: ->
    @_accounts ||= new Accounts(@armorHost(), @authenticator, '')
    @_accounts

  orders: (accountId) ->
    Orders.new(@armorHost(), @authenticator, @accounts().uri(accountId))

  users: (accountId) ->
    Users.new(@armorHost(), @authenticator, @accounts().uri(accountId))


module.exports = API
