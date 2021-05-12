const assert = require('assert')
const { Given, When, Then } = require('@cucumber/cucumber')

Given('today is Monday', function () { this.today = 'Monday' })

When('I ask wether it\'s Friday yet', function () { this.actualAnswer = this.today === "Friday" })

Then('I should be told {string}', function (string) { assert.strictEqual(this.actualAnswer, false) });
