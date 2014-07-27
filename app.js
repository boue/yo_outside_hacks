var express = require("express");
var app = express();
var port = 3000;

app.get("/", function(req, res){
  res.send("It works!");
});

app.get("/yos", function(req, res) {

  // params received from YO
  console.log(req.query);
  res.status(200).end();
})

app.listen(port);
console.log("Listening on port " + port);