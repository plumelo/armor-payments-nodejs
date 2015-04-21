# global describe, it, expect

expect = require('chai').expect
armorPayments = require('../lib')

describe 'armor-payments', ->

  it 'should expose singleton authenticator', ->
    expect(armorPayments).to.be.an('object')
    expect(armorPayments).to.be.an.instanceOf(armorPayments.API)

  it 'should export constructors', ->
    expect(armorPayments.API).to.be.a('function')
    expect(armorPayments.Authenticator).to.be.a('function')
