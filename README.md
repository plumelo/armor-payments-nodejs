# Armor Payments Node.js Client

This is intended to be a clean, idiomatic client for the [Armor Payments API](http://armorpayments.com/api/index.html). 
This will handle generating the authenticated headers and constructing the properly nested request URI, as well as parsing any response JSON for you.

## Installation

To install using npm and add to your application's dependencies:

    $ npm install armor-payments --save

## Usage

The Armor Payments API is REST-ish and nested, so the client relies on chaining. We use (request-promise)[https://www.npmjs.com/package/request-promise] to return a Promise for all operations resulting in an API request, with the added nice-ness that we've parsed the JSON response body for you if possible.


```javascript
var armorPayments = require('armor-payments');

var client = new armorPayments.API('your-key', 'your-secret', shouldUseSandbox);

// There are four top-level resources: accounts, users, orders, and shipmentcarriers
// Querying users and orders requires an accountId
client.accounts.all().then(function (response) {
    // response.body contains parsed JSON object
});
```

Fore more detailed usage examples, See the [Ruby client](https://github.com/Armor-Payments/armor_payments_ruby). We follow the exact conventions with only differences being the usage of camelCase instead of under_scores, and using Promises for handling responses as above.


## Developing

We use CoffeeScript for development. The source files are under *src* and the tests are under *test*. To compile CoffeeScript into JavaScript and run tests, invoke Grunt:

    $ grunt


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request


## License

MIT License. See accompanying LICENSE.txt file.
