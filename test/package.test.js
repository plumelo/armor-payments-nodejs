/* global describe, it, expect */

var expect = require('chai').expect,
    armorPayments = require('../lib');

describe('armor-payments', function() {
  
  it('should expose singleton authenticator', function() {
    expect(armorPayments).to.be.an('object');
    expect(armorPayments).to.be.an.instanceOf(armorPayments.API);
  });
  
  it('should export constructors', function() {
    expect(armorPayments.API).to.be.a('function');
    expect(armorPayments.Authenticator).to.be.a('function');
  });
  
});
