var exec = require('cordova/exec');

var noop = function() {};

module.exports = {
  openDigitsView: function (name, successCallback, errorCallback) {
      successCallback = successCallback || noop;
      errorCallback = errorCallback || noop;

      cordova.exec(successCallback, errorCallback, "Hello", "openDigitsView");
  },
  logoutDigits: function (name, successCallback, errorCallback) {
      successCallback = successCallback || noop;
      errorCallback = errorCallback || noop;

      cordova.exec(successCallback, errorCallback, "Hello", "logoutDigits");
  }
};
