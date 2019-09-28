const JwtStrategy = require("passport-jwt").Strategy;
const ExtractJwt = require("passport-jwt").ExtractJwt;
const mysql = require("./db_connect/mysql");

const opts = {};

opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = "adminentry";

module.exports = passport => {
  passport.use(
    new JwtStrategy(opts, (payload, done) => {

         var password = mysql.mysqlConnection.query(
           "SELECT * FROM libsys_admin WHERE a_id = '" +
             payload.id  +
             "'  ",
           (err, id_rows, fields) => {
            if(!id_rows){
                 return done(null, false);
            }
            else if (id_rows){
                console.log(id_rows[0]);
                 return done(null, id_rows[0]);
            }
            else{
                 console.log(error);
                 return done(error);
            }
           }
         );


   
    })
  );
};
