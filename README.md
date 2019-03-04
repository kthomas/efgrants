# efgrants

Suite of smart contracts to improve transparency and provide lightweight on-chain governance of grants awarded to deserving projects. Build using `truffle` and `solc-0.5.4`.

## Installation

`npm install`

`package.json` contains everything you need, including `truffle` and `solc`.

## Makefile

There is a `Makefile` for convenience which offers the following:

`make clean` - drops build artifacts `flat/` and `tmp/` directories
`make compile` - wrapper around package-local `truffle compile`
`make flat` - flattens all contracts into a single `flat/EfGrants.sol`
`make test` - run the tests
