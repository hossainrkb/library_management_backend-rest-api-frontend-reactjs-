const express = require("express");
const router = express.Router();
const studentController = require("../controllers/studentController");

//create book
router.post("/create", studentController.createStudent);
//ALL student
router.get("/", studentController.getAllStudent);
//ALL student
router.get("/:id", studentController.getStudentById);
//search
router.post("/std/search", studentController.getStudentBySidOrContact);

module.exports = router;
