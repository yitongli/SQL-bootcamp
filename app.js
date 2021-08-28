let mysql = require('mysql2');
var faker = require('faker');

let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Lijimao136',
    database: 'join_us',
});

var person = {
    email:faker.internet.email(),
    created_at:faker.date.past()
}

console.log(person);

var end_result = connection.query('INSERT INTO users SET?', person,function (error, results, fields) {
    if (error) throw error;
    console.log(results);
 });

console.log(end_result.sql)

connection.end();
