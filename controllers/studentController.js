const mysql = require("../db_connect/mysql");
const errorHandling = require("../util/errorHandling");
var dateTime = require("node-datetime");
var dt = dateTime.create();
const studentRegisterValidator = require("../validator/student_reg_validator"); 
const student_search_validator = require("../validator/student_search_validator"); 

const createStudent = (req, res, next) => {
  let { s_roll, s_name, s_contact, s_email, s_address } = req.body;
let validator = studentRegisterValidator({s_roll, s_name, s_contact, s_email, s_address})
if(!validator.isValid){
    res.status(400).json(validator.error)
}
else{

  let student = req.body;
  var post = {
    s_roll: student.s_roll,
    s_name: student.s_name,
    s_contact: student.s_contact,
    s_email: student.s_email,
    s_session: 1,
    s_year: 1,
    s_address: student.s_address,
    s_status: 1
  };

  var search_student = mysql.mysqlConnection.query(
    "SELECT * FROM libsys_students WHERE s_roll = '" + student.s_roll + "'  ",
    (err, rows, fields) => {
      if (rows.length === 0) {
       
      var check_email = mysql.mysqlConnection.query(
    "SELECT * FROM libsys_students WHERE s_email = '" + student.s_email + "'  ",
    (err, email_rows, fields) => {
      if (email_rows.length === 0) {
        //console.log(email_rows.length);
            var check_email = mysql.mysqlConnection.query(
    "SELECT * FROM libsys_students WHERE s_contact = '" + student.s_contact + "'  ",
    (err, contact_rows, fields) => {
      if (contact_rows.length === 0) {
      
           mysql.mysqlConnection.query(
             "INSERT INTO libsys_students SET  ?",
             post,
             (err, rows, fields) => {
               if (!err) {
                 res.status(200).json({
                   success_message: "Student successfully added"
                   //users:rows[0].name
                 });
               } else {
                 console.log(err);
               }
             }
           );
      } else {
        errorHandling.resourceError(res, "This Contact Number had already added");
      }
    }
  );
      } else {
        errorHandling.resourceError(res, "This Email had already added");
      }
    }
  );
      } else {
        errorHandling.resourceError(res, "Student already added");
      }
    }
  );
}
};

//All students
const getAllStudent = (req, res, next) => {
  mysql.mysqlConnection.query(
    "SELECT *from libsys_students",
    (err, rows, fields) => {
      if (!err) {
       if(rows.length !==0){
         res.status(200).json(rows);
           //  message: "All Students",
           //users:rows[0].name
           // type: typeof rows,
           // date: dt.format("Y-m-d"),
           // tomorrow: new Date(),
           // bb: new Date().setDate(new Date().getDate() + 1)
       
       }
       else{
        errorHandling.resourceError(res,"No data found")
       }
      } else {
        console.log(err);
      }
    }
  );
};

//student by id
const getStudentById =  (req,res,next)=>{
  //console.log(req.params.id)
    mysql.mysqlConnection.query(
      "SELECT libsys_students.s_id, libsys_students.s_roll,libsys_students.s_name,libsys_students.s_contact,libsys_students.s_email, libsys_students.s_address,libsys_students.s_status,libsys_year.y_year,libsys_session.sess_name FROM libsys_students INNER JOIN libsys_year ON libsys_students.s_year=libsys_year.y_id  INNER JOIN libsys_session ON libsys_students.s_session=libsys_session.sess_id WHERE s_id = ?",
      [req.params.id],
      (err, row, fields) => {
        if (!err) {
          if (row.length !== 0) {
            res.status(200).json(
              //users:rows[0].name
              row[0]
            );
          } else {
            errorHandling.resourceError(res, "Sorry no student is found");
          }
        } else {
          errorHandling.serverError(res, err);
        }
      }
    );
}
//student by s_roll or mobile
const getStudentBySidOrContact =  (req,res,next)=>{
    let { search } = req.body;
let validator = student_search_validator({ search });
if(!validator.isValid){
    res.status(400).json(validator.error)
}
else{
      //console.log(req.params.id)
     // var sql = "SELECT * FROM `libsys_students` WHERE s_roll = ?";
      console.log(req.body.search)
      mysql.mysqlConnection.query(
       "SELECT * FROM libsys_students WHERE s_roll = '" + req.body.search + "'  ",
        (err, row, fields) => {
          if (!err) {
            if (row.length !== 0) {
              res.status(200).json(
                //users:rows[0].name
                row[0]
              );
            } else {
              errorHandling.resourceError(res, "Sorry no student is found");
            }
          } else {
            errorHandling.serverError(res, err);
          }
        }
      );
    }
 
}


module.exports = {
  createStudent,
  getAllStudent,
  getStudentById,
  getStudentBySidOrContact
};



  