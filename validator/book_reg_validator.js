const validator = require("validator");

const validate = book => {
  let error = {};

  if (!book.b_code) {
    error.code = "please provide book code";
  }
  if (!book.b_name) {
    error.name = "please provide book name";
  } 
  if (!book.b_qty) {
    error.qty = "book quantity ain't be empty";
  }
  if (!book.b_self) {
    error.self = "please provide book self no";
  }
  if (!book.b_price) {
    error.price = "please provide book's price";
  }

  return {
    error,
    isValid: Object.keys(error).length === 0
  };
};
module.exports = validate;
