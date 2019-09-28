const express = require("express");
const router = express.Router();
const adminController = require("../controllers/adminController");

//login
router.post("/login", adminController.loginadmin);


module.exports = router;
