const express = require("express");
var app = express();
var bodyParser = require("body-parser");
const bookRouter = require("./routers/bookRouter")
const studentRouter = require("./routers/studentRouter")
const adminRouter = require("./routers/adminRouter")
const passport = require("passport")
app.use(bodyParser.json());


app.use(passport.initialize());
require("./passport")(passport);
//book 
app.use("/book", bookRouter);
//student 
app.use("/student", studentRouter);
//admin 
app.use("/admin", adminRouter);


app.listen(4000, () => {
  console.log("Server running on port 4000");
});



