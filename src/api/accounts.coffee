Resource = require('./resource')


class Accounts extends Resource

  create: (data) ->
    headers = @authenticator.secureHeaders 'post', @uri()
    @request 'post', { path: @uri(), headers: headers, body: JSON.generate(data) }

  update: (accountId, data) ->
    headers = @authenticator.secureHeaders 'post', @uri(accountId)
    @request 'post', { path: @uri(accountId), headers: headers, body: JSON.generate(data) }

  bankaccounts: (accountId) ->
    new BankAccounts(@host, @authenticator, @uri(accountId))


 module.exports = Accounts
