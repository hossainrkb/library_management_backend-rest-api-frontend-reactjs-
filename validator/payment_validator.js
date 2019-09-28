const validator = require("validator");

const validate = pay => {
  let error = {};

  if (!pay.i_paid) {
    error.payment = "please provide payment";
  }
 
  return {
    error,
    isValid: Object.keys(error).length === 0
  };
};
module.exports = validate;
