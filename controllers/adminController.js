const mysql = require("../db_connect/mysql");
const errorHandling = require("../util/errorHandling");
const adminloginValidator = require("../validator/admin_login_validator");
var jwt = require("jsonwebtoken");

const loginadmin = (req, res, next) => {
  let { a_contact, a_password } = req.body;
  let validator = adminloginValidator({
    a_contact,
    a_password
  });
  if (!validator.isValid) {
    res.status(400).json(validator.error);
  } else {
    let admin = req.body;
    var search_admin = mysql.mysqlConnection.query(
      "SELECT * FROM libsys_admin WHERE a_contact = '" + admin.a_contact + "'  ",
      (err, e_rows, fields) => {
        if (e_rows.length === 1) {
          var password = mysql.mysqlConnection.query(
            "SELECT * FROM libsys_admin WHERE a_password = '" +
              admin.a_password +
              "'  ",
            (err, pass_rows, fields) => {
              if (pass_rows.length === 1) {
               console.log(e_rows[0].a_contact)
                var token = jwt.sign(
                  {
                    id: e_rows[0].a_id,
                    name: e_rows[0].a_name,
                    contact: e_rows[0].a_contact
                  },
                  "adminentry",
                  { expiresIn: "2h" }
                );
                res.json({
                message: " AdminLogin Successful",
                token: `Bearer ${token}`
                });
                
              } else {
                errorHandling.resourceError(res, "Password didn't match");
              }
            }
          );
        } else {
          errorHandling.resourceError(res, "Admin's contact number not found");
        }
      }
    );
  }
};

module.exports = {
  loginadmin,
};
