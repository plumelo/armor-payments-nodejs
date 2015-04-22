Resource = require('./resource')


class BankAccounts extends Resource

  create: (data) ->
    headers = @authenticator.secureHeaders 'post', @uri()
    request 'post', { uri: @uri(), headers: headers, body: JSON.stringify data }


module.exports = BankAccounts
