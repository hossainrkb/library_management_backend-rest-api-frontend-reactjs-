const serverError = (res,err)=>{
    res.status(200).json({
        message:"Error happened",
        error:err
    })
}
const resourceError = (res, message) => {
  res.status(200).json({
    message: message
  });
};

module.exports = {
    serverError,
    resourceError
}