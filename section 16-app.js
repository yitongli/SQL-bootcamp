var express = require('express');
let mysql = require('mysql2');
var app = express();
var bodyParser = require("body-parser");
const faker = require('faker');

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({
    extended:true
}));

let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Lijimao136',
    database: 'join_us',
});


app.get("/", function(req, res){
    var q = 'SELECT COUNT(*) as count FROM users';
    connection.query(q, function (error, results) {
    if (error) throw error;
    var count = results[0].count
    res.render("home",{count: count});
    });
   });

app.post("/register",function(req,res){
    var person = {
        email:req.body.email
    };

    connection.query('INSERT INTO users SET?', person,function (error, results, fields) {
        if (error) throw error;
        console.log(results);
    });
    
});

app.get("/joke",function(req,res){
    var joke = "What do you call a dog that does magic tricks? A labracadabrador.";
    res.send(joke);
})

app.get("/random_num",function(req,res){
    var num = Math.floor(Math.random()*10)+1;
    res.send('you lucky number is '+ num);
});

var server = app.listen(3307,function(){
    var host = server.address().address
    var port = server.address().port
    console.log("应用实例，访问地址为 http://%s:%s", host, port)
});



