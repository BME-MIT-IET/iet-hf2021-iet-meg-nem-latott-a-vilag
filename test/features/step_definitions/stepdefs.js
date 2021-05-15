const assert = require('assert')
const { Given, When, Then, Before } = require('@cucumber/cucumber')
const Url = require('../../../url.min.js');

Before({tags: '@encode or @decode'}, () => this.url = new Url("http://example.com"))

Given('an url {string}', (url) => this.url = new Url(url))

Given('it has a parameter {string} with value {string}', (parameter, value) => this.url.query[parameter] = value)

Given('an url part {string}', (urlPart) => this.urlPart = urlPart)

Given('the url has the following parameters: {string}', (parameters) => {
    let params = parameters.split(', ')
    params.forEach(param => this.url.query[param] = 1)
})

Given('an encoded url part {string}', (encodedPart) => this.encodedUrlPart = encodedPart )



When('I decode the url part', () => this.urlPart = this.url.decode(this.encodedUrlPart))

When('I delete the parameter {string}', (parameter) => delete this.url.query[parameter])

When('I add a parameter {string} with the value {string}', (parameter, value) => this.url.query[parameter] = value )

When('I change the value of {string} to {string}', (parameter, value) => this.url.query[parameter] = value)

When('I clear all the parameters', () => this.url.clearQuery())

When('i change the path of url to {string}', (pathString) => {
    let inPaths = pathString.split(', ')
    this.url.paths(inPaths)
})

When('I set the port to {string}', (port) => this.url.port = port )

When('I set the anchor {string}', (anchor) => this.url.hash = anchor)

When('I set the host to {string}', (host) => this.url.host = host)

When('I add the password {string}', (password) => this.url.pass = password)

When('I add the user name {string}', (username) => this.url.user = username)

When('I change the protocol to {string}', (protocol) => this.url.protocol = protocol)

When('I ask the the count of parameters', () => this.paramCount = this.url.queryLength())

When('I ask wether it has parameters', () => this.hasParam = this.url.isEmptyQuery() ? "No" : "Yes" )

When('I encode the url part', () => this.encodedUrlPart = this.url.encode(this.urlPart))



Then('the url will have a parameter with name {string} and value {string}', (parameter, value) => assert.strictEqual(this.url.query[parameter], value))

Then('the url won\'t have the parameter {string}', (parameter) => assert.strictEqual(this.url.query[parameter], undefined))

Then('the value of {string} will be {string}', (parameter, value) => assert.strictEqual(this.url.query[parameter], value))

Then('the url will be {string}', (parameter) => assert.strictEqual(this.url.toString(), parameter))

Then('It\'ll be {string}', (num) => assert.strictEqual(this.paramCount, parseInt(num)))

Then('the answer will be {string}', (answer) => assert.strictEqual(this.hasParam, answer) )
  
Then('the url part will be {string}', (expectedEncoding) => assert.strictEqual(this.encodedUrlPart, expectedEncoding))

Then('the decoded url part will be {string}',(decodedUrlPart) => assert.strictEqual(this.urlPart, decodedUrlPart))
