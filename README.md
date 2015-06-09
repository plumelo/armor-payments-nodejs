# Armor Payments Node.js Client

This is intended to be a clean, idiomatic client for the [Armor Payments
API](http://armorpayments.com/api/index.html).  This will handle generating the
authenticated headers and constructing the properly nested request URI, as well
as parsing any response JSON for you.

[![Circle CI](https://circleci.com/gh/globality-corp/armor-payments-nodejs/tree/develop.svg?style=svg)](https://circleci.com/gh/globality-corp/armor-payments-nodejs/tree/develop)
[![npm version](https://badge.fury.io/js/armor-payments.svg)](http://badge.fury.io/js/armor-payments)

## Installation

To install use `npm` and add the package to your application's dependencies:

    $ npm install armor-payments --save

## Usage

The Armor Payments API is REST-ish and nested, so the client relies on
chaining. We use
[request-promise](https://www.npmjs.com/package/request-promise) to return a
Promise for all operations resulting in an API request, with the added
nice-ness that we've parsed the JSON response body for you if possible.


```javascript
var armorPayments = require('armor-payments');

var client = new armorPayments.API('your-key', 'your-secret', shouldUseSandbox);

// There are four top-level resources: accounts, users, orders, and shipmentcarriers
// Querying users and orders requires an accountId
client.accounts().all().then(function (response) {
    // response.body contains parsed JSON object
});
```

Fore more detailed usage examples, See the [Ruby
client](https://github.com/Armor-Payments/armor_payments_ruby). We follow the
same API naming and method chaining conventions with only differences being the
usage of camelCase instead of under_scores, and using Promises for handling
responses as above.


## Developing

We use CoffeeScript for development. The source files are under *src* and the
tests are under *test*. To compile CoffeeScript into JavaScript and run tests,
invoke Grunt:

    $ grunt

Features branching and release management are handled using
[git-flow](https://github.com/nvie/gitflow), and active development is always
done on the *develop* branch.


## Releasing a Version

Making a release involves the following steps:

1. Update CHANGELOG.md with relevant changes
1. Create new release branch, for example:

        $ git flow release start v0.2.0

1. Bump version:

        $ npm version --no-git-tag-version [major|minor|patch|...]

1. Commit and finalize release:

        $ git commit -a -m "bumped version for release"
        $ git flow release finish v0.2.0

1. Push to NPM:

        $ npm publish


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request


## License

MIT License. See accompanying [LICENSE.txt](LICENSE.txt) file.
