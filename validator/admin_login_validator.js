const validator = require("validator");

const validate = admin => {
  let error = {};
  if (!admin.a_contact) {
    error.contact = "please provide your contact number";
  }
  if (!admin.a_password) {
    error.password = "please provide your password";
  }
  return {
    error,
    isValid: Object.keys(error).length === 0
  };
};
module.exports = validate;
