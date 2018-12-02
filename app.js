const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

// Create connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // enter your password
  database: 'BulletsInk'
});

// Connect
db.connect(err => {
  if (err) {
    throw err;
  }
  console.log('MySql Connected...');
});

const app = express();
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Create DB
app.get('/createdb', (req, res) => {
  let sql = 'CREATE DATABASE BulletsInk';
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('database created...');
  });
});

// Create Table
app.get('/createreservationtable', (reg, res) => {
  let sql =
    'CREATE TABLE reservations(id int AUTO_INCREMENT, firstName VARCHAR(255), lastName VARCHAR(255), email VARCHAR(255), phoneNumber VARCHAR(255), artist VARCHAR(255), resvDate date, PRIMARY KEY (id))';
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Reservations table created...');
  });
});

// Insert post 2
app.get('/addpost2', (reg, res) => {
  let post = { title: 'Post Two', body: 'This is post number two' };
  let sql = 'INSERT INTO posts SET ?';
  let query = db.query(sql, post, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Post 2 added...');
  });
});

app.post('/addreservation', (req, res) => {
  let reservation = {
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email,
    phoneNum: req.body.phoneNum,
    artist: req.body.artist,
    resvDate: req.body.resvDate
  };

  //   let validationQuery = `SELECT * FROM reservation where ${
  //     reservation.artist
  //   } AND ${reservation.resvDate}`;
  //   if (validationQuery) {
  //     return res
  //       .status(401)
  //       .json({
  //         duplicateresv: 'An artist already has an appointment at that time.'
  //       });
  //   }

  let sql = 'INSERT INTO reservation SET ?';
  let query = db.query(sql, reservation, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Reservation created' });
  });
});

//app.use('/addreservation');

// // Select posts
// app.get('/getposts', (reg, res) => {
//   let sql = 'SELECT * FROM posts';
//   let query = db.query(sql, (err, results) => {
//     if (err) throw err;
//     console.log(results);
//     res.send('Posts fetched...');
//   });
// });

// // Select single post
// app.get('/getpost/:id', (req, res) => {
//   let sql = `SELECT * FROM posts WHERE id = ${req.params.id}`;
//   let query = db.query(sql, (err, result) => {
//     if (err) throw err;
//     console.log(result);
//     res.send('Post fetched...');
//   });
// });

// // Update post
// app.get('/updatepost/:id', (req, res) => {
//   let newTitle = 'Updated Title';
//   let sql = `UPDATE posts SET title = '${newTitle}' WHERE id = '${
//     req.params.id
//   }'`;
//   let query = db.query(sql, (err, result) => {
//     if (err) throw err;
//     console.log(result);
//     res.send('Post updated...');
//   });
// });

// // Delete post
// app.get('/deletepost/:id', (req, res) => {
//   let newTitle = 'Updated Title';
//   let sql = `DELETE FROM posts WHERE id = '${req.params.id}'`;
//   let query = db.query(sql, (err, result) => {
//     if (err) throw err;
//     console.log(result);
//     res.send('Post deleted...');
//   });
// });

app.listen('4000', () => {
  console.log('Server started on port 4000');
});
