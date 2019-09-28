const validate = search_std => {
  let error = {};

  if (!search_std.search) {
    error.search_student = "Please provide student id or mobile number ";
  }
 
  return {
    error,
    isValid: Object.keys(error).length === 0
  };
};
module.exports = validate;
