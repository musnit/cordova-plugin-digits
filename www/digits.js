/*global cordova, module*/

module.exports = {
  openDigitsView: function (name, successCallback, errorCallback) {
      cordova.exec(successCallback, errorCallback, "Hello", "openDigitsView");
  }
};
