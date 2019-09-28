const validator = require("validator");

const validate = issue => {
  let error = {};

  if (!issue.b_code) {
    error.code = "please provide book code";
  }
  if (!issue.s_roll) {
    error.roll = "please provide ID no";
  }
  return {
    error,
    isValid: Object.keys(error).length === 0
  };
};
module.exports = validate;
