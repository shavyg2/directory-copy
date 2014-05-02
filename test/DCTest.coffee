DirectoryCopy = require("../bin/cli.js").DirectoryCopy

TestCase = require("beast-test").TestCase

new class DCTest extends TestCase
  constructor:->
    super()

  base:->
    new DirectoryCopy("source","destination")

  testDC:(dc)->


console.log TestCase.getResult();

