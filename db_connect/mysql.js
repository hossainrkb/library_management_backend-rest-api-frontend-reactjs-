const mysql = require("mysql");
var mysqlConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "libsys",
  multipleStatements: true
});

mysqlConnection.connect(err => {
  if (!err) {
    console.log("Database successfully connected");
  } else {
    console.log("not connected" + JSON.stringify(err, undefined, 2));
  }
});
module.exports = {
    mysqlConnection
}