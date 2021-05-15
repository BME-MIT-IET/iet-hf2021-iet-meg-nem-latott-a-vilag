const assert = require('assert')
const { Given, When, Then } = require('@cucumber/cucumber')
const Url = require('../../../url.min.js');


Given('an url {string}', (url) => this.url = new Url(url))

Given('it has a parameter {string} with value {string}', (parameter, value) => this.url.query[parameter] = value)

When('I delete the parameter {string}', (parameter) => delete this.url.query[parameter])

When('I add a parameter {string} with the value {string}', (parameter, value) => this.url.query[parameter] = value )

When('I change the value of {string} to {string}', (parameter, value) => this.url.query[parameter] = value)

When('I clear all the parameters', () => this.url.clearQuery())

Then('the url will have a parameter with name {string} and value {string}', (parameter, value) => assert.strictEqual(this.url.query[parameter], value))

Then('the url won\'t have the parameter {string}', (parameter) => assert.strictEqual(this.url.query[parameter], undefined))

Then('the value of {string} will be {string}', (parameter, value) => assert.strictEqual(this.url.query[parameter], value))

Then('the url will be {string}', (parameter) => assert.strictEqual(this.url.toString(), parameter))

When('I change the protocol to {string}', (protocol) => this.url.protocol = protocol)

When('i change the path of url to {string}', (pathString) => {
    let inPaths = pathString.split(', ')
    this.url.paths(inPaths)
})

When('I set the port to {string}', (port) => this.url.port = port )

When('I set the anchor {string}', (anchor) => this.url.hash = anchor)

When('I set the host to {string}', (host) => this.url.host = host)
