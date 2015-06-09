## 0.1.4 (June 9, 2015)

This release merges Pull Request #2 (https://github.com/globality-corp/armor-payments-nodejs/pull/2) and updates README with
instructions on building a release. Thanks @darthrevino for the PR!

Features:

    - Adding a shipmentcarriers() method to the API.
    - Adding tests to the ShipmentCarriers class
    - Adding tests to the API to verify subresources are constructed correctly
    - Updated README.md with instructions on releasing a package version

## 0.1.3 (June 9, 2015)

Bugfixes:

  - Fixed errornous usage of JSON.generate in Users.update(), Fixes Issue #1

## 0.1.2 (April 23, 2015)

Bugfixes:

  - Fixed a syntax error in API client to do with creating the Orders and Users resource instances.

## 0.1.1 (April 22, 2015)

Bugfixes:

  - Fixed a couple cases of missing require statements in api/order.coffee and api/users.coffee modules.

## 0.1.0 (April 22, 2015)

Features:

  - Initial Release
