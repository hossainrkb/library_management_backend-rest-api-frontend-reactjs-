const express = require("express");
const router = express.Router();
const bookController = require("../controllers/bookController");
const authenticate = require("../authenticate");

//create book
router.post("/create", bookController.createBook);
//issue book
router.post("/issue", bookController.issueBook);
//return book
router.post("/return", bookController.returnBook);
//pay book
router.post("/paid", bookController.paymentPaid);
//ALL books
router.get("/", authenticate, bookController.getAllBooks);
//ALL ISSUE books
router.get("/issue_book_list", bookController.getAllIssueBook);
//ALL ISSUE books by s id
router.get("/issue_book/:id", bookController.getAllIssueBookBySid);


module.exports = router;
