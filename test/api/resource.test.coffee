should = require('chai').should()
sinon = require('sinon')
timekeeper = require('timekeeper')
Authenticator = require('../lib').Authenticator
Resource = require('../lib').Resource


describe 'Resource', ->
  authenticator = new Authenticator('my-api-key', 'my-secret-code')
  host = 'https://sandbox.armorpayments.com'
  uriRoot = '/wibble/123'
  resource = new Resource(host, authenticator, uriRoot)
  # let(:successful_response) { Excon::Response.new(status: 200, body: '{'whee':42}', headers: { 'Content-Type' => 'application/json' })

  describe '#uri', ->
    it 'returns '/%{uri_root}/resource_name' if given no id', ->
      resource.uri.should.equal('/wibble/123/resource')

    it 'returns '/%{uri_root}/resource_name/:id' if given an id', ->
      resource.uri(456).should.equal('/wibble/123/resource/456')

  describe '#request', ->
    context 'on a response with a JSON body', ->
      it 'returns the parsed JSON body', ->
        resource.connection.stub(:get).and_return(successful_response)
        response = resource.request('get', {})
        response.body.should.eql({ 'whee': 42 })

    context 'on a response without JSON', ->
      it 'returns the full response object', ->
        failed_response = Excon::Response.new(status: 502, body: 'Gateway Timeout')
        resource.connection.stub(:get).and_return(failed_response)
        response = resource.request('get', {})
        response.body.should.equal('Gateway Timeout')

  context 'smoketest', ->
    describe '#all', ->
      it 'queries the host for all of the resources, with approprate headers', ->
        timekeeper.freeze new Date("2014-02-22T17:00:00Z")
        resource.connection.should_receive(:get).with({
          path: '/wibble/123/resource',
          headers: {
            'X_ARMORPAYMENTS_APIKEY': 'my-api-key'
            'X_ARMORPAYMENTS_REQUESTTIMESTAMP': '2014-02-22T17:00:00Z'
            'X_ARMORPAYMENTS_SIGNATURE': 'ec41629dc204b449c71bf89d1be4630f5353e37869197f5a926539f6fc676ebcccdb5426fb3f01a01fa7dc9551d38d152e41294a5147b15e460d09ff60cf1562'
          }
        }).and_return(successful_response)

        resource.all

    describe '#get', ->
      it 'queries the host for a specific resource, with approprate headers', ->
        timekeeper.freeze new Date("2014-02-22T17:00:00Z")
        resource.connection.should_receive(:get).with({
          path: '/wibble/123/resource/456',
          headers: {
            'X_ARMORPAYMENTS_APIKEY': 'my-api-key'
            'X_ARMORPAYMENTS_REQUESTTIMESTAMP': '2014-02-22T17:00:00Z'
            'X_ARMORPAYMENTS_SIGNATURE': '48886620cfebb95ffd9ee351f4f68d4f103a8f4bdc0e3301f7ee709ec2cf3c19588ae1b67aa8ee38305de802651fb10093cf1af40f467ac936185d551a58a844'
          }
        }).and_return(successful_response)

        resource.get(456)
