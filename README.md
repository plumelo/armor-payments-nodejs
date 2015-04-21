# Armor Payments Node.js Client

This is intended to be a clean, idiomatic client for the [Armor Payments API](http://armorpayments.com/api/index.html). 
This will handle generating the authenticated headers and constructing the properly nested request URI, as well as parsing any response JSON for you.

## Installation

To install using npm and add to your application's dependencies:

    $ npm install armor-payments --save

## Usage

See the [Ruby Client](https://github.com/Armor-Payments/armor_payments_ruby) for detailed usage examples. We follow the exact implementation in the Node.js version.

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
