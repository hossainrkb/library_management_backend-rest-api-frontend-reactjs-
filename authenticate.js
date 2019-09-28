const passport = require("passport");

module.exports = (req, res, next) => {
  passport.authenticate("jwt", (err, admin, info) => {
    if (err) {
      console.log(info);
      console.log(err);
      return next(err);
    }

    if (!admin) {
      return res.status(400).json({
        message: "Authentication Failed"
      });
    }

    req.adminK = admin;
    return next();
  })(req, res, next);
};
