// Generated by CoffeeScript 1.7.1
(function() {
  var DCTest, DirectoryCopy, TestCase,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DirectoryCopy = require("../lib/application.js").DirectoryCopy;

  TestCase = require("beast-test").TestCase;

  new (DCTest = (function(_super) {
    __extends(DCTest, _super);

    function DCTest() {
      DCTest.__super__.constructor.call(this);
    }

    DCTest.prototype.base = function() {
      debugger;
      return new DirectoryCopy("source", "destination", true);
    };

    DCTest.prototype.testDC = function(dc) {
      return dc.getFiles();
    };

    return DCTest;

  })(TestCase));

  console.log(TestCase.getResult());

}).call(this);
