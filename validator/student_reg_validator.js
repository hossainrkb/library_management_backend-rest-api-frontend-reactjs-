const validator = require("validator");

const validate = student => {
  let error = {};
  if (!student.s_name) {
    error.name = "please provide your name";
  }
  if (!student.s_email) {
    error.email = "please provide your email";
  } else if (!validator.isEmail(student.s_email)) {
    error.email = "please provide a valid email";
  }
   if (!student.s_roll) {
     error.id = "please provide your ID no";
   }
   if (!student.s_contact) {
     error.contact = "please provide your Contact no";
   }
   if (!student.s_address) {
     error.address = "please provide your Contact no";
   }


  return {
    error,
    isValid: Object.keys(error).length === 0
  };
};
module.exports = validate;
