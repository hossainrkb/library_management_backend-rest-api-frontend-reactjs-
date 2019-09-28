const mysql = require("../db_connect/mysql");
const errorHandling = require("../util/errorHandling");
var dateTime = require("node-datetime");
var moment = require("moment");
var dt = dateTime.create();
const bookRegisterValidator = require("../validator/book_reg_validator"); 
const IssueValidator = require("../validator/issue_book_validator"); 
const payValidator = require("../validator/payment_validator"); 


const createBook = (req,res,next)=>{
    let { b_code, b_name, b_qty, b_self, b_price } = req.body;
let validator = bookRegisterValidator({b_code, b_name, b_qty, b_self, b_price})
if(!validator.isValid){
    res.status(400).json(validator.error)
}
else{
   let book = req.body;
   var post = {
     b_code: book.b_code,
     b_name: book.b_name,
     b_publishar: 1,
     b_qty: book.b_qty,
     b_self: book.b_self,
     b_row: 1,
     b_medium: 1,
     b_price: book.b_price,
     b_status: 1
   };

   var search_book = mysql.mysqlConnection.query(
     "SELECT * FROM libsys_books WHERE b_code = '" + book.b_code + "'  ",
     (err, rows, fields) => {
       if (rows.length === 0) {
         console.log(rows.length);
         mysql.mysqlConnection.query(
           "INSERT INTO libsys_books SET  ?",
           post,
           (err, rows, fields) => {
             if (!err) {
               res.status(200).json({
                 success_message: "Book successfully added"
                 //users:rows[0].name
               });
             } else {
               console.log(err);
             }
           }
         );
       } else {
         errorHandling.resourceError(res, "Book already added");
       }
     }
   );
}
   

   

}

const getAllBooks = (req,res,next)=>{
      mysql.mysqlConnection.query(
        "SELECT *from libsys_books ORDER BY b_id DESC",
        (err, rows, fields) => {
          if (!err) {
            res.status(200).json(
              //users:rows[0].name
              rows
            );
             // type: typeof rows,
             // date: dt.format("Y-m-d"),
             // tomorrow: new Date(),
             // bb: new Date().setDate(new Date().getDate() + 1)
           
          } else {
            console.log(err);
          }
        }
      );
 

}
const getAllIssueBook = (req, res, next) => {
  var sql =  "SELECT libsys_issue.i_book_id, libsys_students.s_roll,libsys_students.s_id,libsys_books.b_code,libsys_books.b_id, libsys_issue.i_date,libsys_issue.i_r_date FROM libsys_issue INNER JOIN libsys_students ON libsys_issue.i_student_id=libsys_students.s_id  INNER JOIN libsys_books ON libsys_issue.i_book_id=libsys_books.b_id WHERE i_status = ?";
  mysql.mysqlConnection.query(sql,[1],
    (err, rows, fields) => {
      if (!err) {
        res.status(200).json(
          //users:rows[0].name
          rows
        );
        // type: typeof rows,
        // date: dt.format("Y-m-d"),
        // tomorrow: new Date(),
        // bb: new Date().setDate(new Date().getDate() + 1)
      } else {
        console.log(err);
      }
    }
  );
};
const getAllIssueBookBySid = (req, res, next) => {
  var sql =  "SELECT libsys_issue.i_book_id, libsys_students.s_roll,libsys_students.s_id,libsys_books.b_code,libsys_books.b_id, libsys_issue.i_date,libsys_issue.i_r_date FROM libsys_issue INNER JOIN libsys_students ON libsys_issue.i_student_id=libsys_students.s_id  INNER JOIN libsys_books ON libsys_issue.i_book_id=libsys_books.b_id WHERE s_id = ? AND i_status = ?";
  mysql.mysqlConnection.query(sql,[req.params.id,1], 
    (err, rows, fields) => {
      if (!err) {
        res.status(200).json(
          //users:rows[0].name
          rows
        );
        // type: typeof rows,
        // date: dt.format("Y-m-d"),
        // tomorrow: new Date(),
        // bb: new Date().setDate(new Date().getDate() + 1)
      } else {
        console.log(err);
      }
    }
  );
};
const issueBook = (req, res, next) => {
    let { b_code, s_roll } = req.body;
let validator = IssueValidator({ b_code, s_roll});
if(!validator.isValid){
    res.status(400).json(validator.error)
}
else{
var search_book = mysql.mysqlConnection.query(
  "SELECT * FROM libsys_books WHERE b_code = '" + req.body.b_code + "'  ",
  (err, rows, fields) => {
    if (rows.length > 0) {
      var search_student = mysql.mysqlConnection.query(
        "SELECT * FROM libsys_students WHERE s_roll = '" +
          req.body.s_roll +
          "'  ",
        (err, s_rows, fields) => {
          if (s_rows.length > 0) {
            // console.log(rows[0].b_id);
            var check_key = "" + rows[0].b_id + "." + s_rows[0].s_id;

            var check_issue = mysql.mysqlConnection.query(
              "SELECT * FROM `libsys_issue` WHERE `i_check` = '" +
                check_key +
                "' AND i_status = 0 ",
              (err, ck_rows, fields) => {
                if (ck_rows.length > 0) {
                  // console.log(rows[0].b_id);
                  var post = {
                    i_date: req.body.i_date,
                    i_r_date: req.body.i_r_date,
                    i_status: 1
                  };
                  mysql.mysqlConnection.query(
                    "UPDATE libsys_issue SET  ? WHERE i_check  = '" +
                      check_key +
                      "' ",
                    post,
                    (err, row, fields) => {
                      if (!err) {
                        res.status(200).json({
                          success_message: "You take this book again.(Issue Done)"
                        });
                      } else {
                        console.log(err);
                      }
                    }
                  );
                } else {
                  var check_renew = mysql.mysqlConnection.query(
                    "SELECT * FROM `libsys_issue` WHERE `i_check` = '" +
                      check_key +
                      "' AND i_status = 1 ",
                    (err, rn_rows, fields) => {
                      if (rn_rows.length > 0) {
                        var post = {
                          i_date: req.body.i_date,
                          i_r_date: req.body.i_r_date,
                          i_status: 1
                        };
                        mysql.mysqlConnection.query(
                          "UPDATE libsys_issue SET  ? WHERE i_check  = '" +
                            check_key +
                            "' ",
                          post,
                          (err, issue_row, fields) => {
                            console.log(issue_row);
                            if (!err) {
                              res.status(200).json({
                                success_message: "Renew Successful",
                                issue: issue_row
                              });
                            } else {
                              console.log(err);
                            }
                          }
                        );
                      } else {
                        // errorHandling.resourceError(res, "Sorry, You don't return this book yet!");
                        var post = {
                          i_book_id: rows[0].b_id,
                          i_student_id: s_rows[0].s_id,
                          i_check: "" + rows[0].b_id + "." + s_rows[0].s_id,
                          i_date: req.body.i_date,
                          i_r_date: req.body.i_r_date,
                          i_fine: 0,
                          i_paid: 0,
                          i_fine_type: 0,
                          i_status: 1
                        };

                        mysql.mysqlConnection.query(
                          "INSERT INTO libsys_issue SET  ?",
                          post,
                          (err, rows, fields) => {
                            if (!err) {
                              res.status(200).json({
                                success_message: "Issue successful"
                              });
                            } else {
                              console.log(err);
                            }
                          }
                        );
                      }
                    }
                  );
                }
              }
            );
          } else {
            errorHandling.resourceError(res, "Student is not found");
          }
        }
      );
    } else {
      errorHandling.resourceError(res, "Book is not found");
    }
  }
);

      
}
    
    }

    
const returnBook = (req, res, next) => {
  let { b_code, s_roll } = req.body;
  let validator = IssueValidator({ b_code, s_roll });
  if (!validator.isValid) {
    res.status(400).json(validator.error);
  } else {
    var search_book = mysql.mysqlConnection.query(
      "SELECT * FROM libsys_books WHERE b_code = '" + req.body.b_code + "'  ",
      (err, rows, fields) => {
        if (rows.length > 0) {
          var search_student = mysql.mysqlConnection.query(
            "SELECT * FROM libsys_students WHERE s_roll = '" +
              req.body.s_roll +
              "'  ",
            (err, s_rows, fields) => {
              if (s_rows.length > 0) {
                // console.log(rows[0].b_id);
                var check_key = "" + rows[0].b_id + "." + s_rows[0].s_id;

                var check_issue = mysql.mysqlConnection.query(
                  "SELECT * FROM `libsys_issue` WHERE `i_check` = '" +
                    check_key +
                    "' AND i_status = 1 ",
                  (err, ck_rows, fields) => {
                    if (ck_rows.length > 0) {
                     
                                             // var a = moment([2007 - 2 - 5]);
                                             // var b = moment([2007 - 2 - 3]);
                                             // 86400000
                                              
                        var current = moment();
                       
                        var return_date = moment(ck_rows[0].i_r_date);
                      
                       var days = current.diff(return_date, "days");
                        var fine_count = 1;
                        var t_fine = 0;
                        if (days > 0) {
                          t_fine = Math.abs(days) * fine_count;
                        }
                        if(t_fine>0){
                        
                         res.status(200).json({
                           fine_message: `Sorry, You have some fine apparently ${t_fine} Tk. `,
                           fine: t_fine,
                           ck_key: check_key
                         });
                        }
                        else{
                              var post = {
                        i_r_date: req.body.u_i_r_date,
                        i_status: 0
                      };
                      mysql.mysqlConnection.query(
                        "UPDATE libsys_issue SET  ? WHERE i_check  = '" +
                          check_key +
                          "' ",
                        post,
                        (err, row, fields) => {
                          if (!err) {
                            res.status(200).json({
                              success_message:
                                "Book Return Successful"
                            });
                          } else {
                            console.log(err);
                          }
                        }
                      );
                          
                        }
                        
                     
                                            } else {
                       errorHandling.resourceError(res, "You didn't take this book");
                    }
                  }
                );
              } else {
                errorHandling.resourceError(res, "Student is not found");
              }
            }
          );
        } else {
          errorHandling.resourceError(res, "Book is not found");
        }
      }
    );
  }
};

    
const paymentPaid = (req, res, next) => {
  let { i_paid } = req.body;
  let validator = payValidator({ i_paid });
  if (!validator.isValid) {
    res.status(400).json(validator.error);
  } else {
    var fine = req.body.book_fine;
    var paid = req.body.i_paid;
    console.log(fine)
    console.log(paid)
    console.log(req.body.p_i_r_date);
    console.log(req.body.ck_key);
      if(fine == paid){
              var post = {
                i_r_date: req.body.p_i_r_date,
                i_status: 0,
                i_fine: req.body.book_fine,
                i_paid: req.body.i_paid
              };
              mysql.mysqlConnection.query(
                "UPDATE libsys_issue SET  ? WHERE i_check  = '" +
                  req.body.ck_key +
                  "' ",
                post,
                (err, row, fields) => {
                  if (!err) {
                    res.status(200).json({
                      paid_message:
                        "Payment Successful and Book returned as well "
                    });
                  } else {
                    console.log(err);
                  }
                }
              );
      }
      else{
         res.status(200).json({
           equal_pay: "You have to pay equal money like your FINE "
         });
      }
              
  }
};


module.exports = {
  createBook,
  getAllBooks,
  issueBook,
  returnBook,
  getAllIssueBook,
  paymentPaid,
  getAllIssueBookBySid
};




