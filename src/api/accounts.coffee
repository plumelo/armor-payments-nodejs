BankAccounts = require('./bankaccounts')
Resource = require('./resource')


class Accounts extends Resource

  create: (data) ->
    headers = @authenticator.secureHeaders 'post', @uri()
    @request 'post', { uri: @uri(), headers: headers, body: JSON.stringify data }

  update: (accountId, data) ->
    headers = @authenticator.secureHeaders 'post', @uri(accountId)
    @request 'post', { uri: @uri(accountId), headers: headers, body: JSON.stringify data }

  bankaccounts: (accountId) ->
    new BankAccounts(@host, @authenticator, @uri(accountId))


 module.exports = Accounts
