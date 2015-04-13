var validate = require('./basicValidations.js');

exports.validateCoordinates = function(userData) {
  return validate.coordinatesExist(userData) && 
    validate.containsOnlyNumbers(userData) &&
    validate.inRange(userData);
};

var userData = {x: '33', y: '34', z: '32'};
console.log(exports.validateCoordinates(userData));

