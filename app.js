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

// sanity check
app.get('/', (req, res) => res.json({ msg: 'Hello' }));

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

/*
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
*/

// post addreservation
app.post('/addreservation', (req, res) => {
  let reservation = {
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email,
    phoneNum: req.body.phoneNum,
    artist: req.body.artist,
    resvDate: req.body.resvDate
  };
  let sql = 'INSERT INTO reservation SET ?';
  let query = db.query(sql, reservation, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Reservation created' });
  });
});

// post customer account
app.post('/customeraccount', (req, res) => {
  let customer_account = {
    Cust_id: req.body.Cust_id,
    Uname: req.body.Uname,
    Passwd: req.body.Passwd,
    Email: req.body.Email,
    Phone: req.body.Phone
  };
  let sql = 'INSERT INTO customer_account SET ?';
  let query = db.query(sql, customer_account, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Account Created' });
  });
});

// post manager
app.post('/manager', (req, res) => {
  let manager = {
    Man_id: req.body.Man_id, 
    Fname: req.body.Fname,
    Lname: req.body.Lname,
    Shop_id: req.body.Shop_id

  };
  let sql = 'INSERT INTO manager SET ?';
  let query = db.query(sql, manager, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Manager Created' });
  });
});

// post manager account
app.post('/manageraccount', (req, res) => {
  let manager_account = {
    Man_id: req.body.Man_id, 
    Uname: req.body.Uname,
    Passwd: req.body.Passwd
    
  };
  let sql = 'INSERT INTO manager_account SET ?';
  let query = db.query(sql, manager_account, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Manager Account Created' });
  });
});

// post merchandies
app.post('/merchandise', (req, res) => {
  let merchandise = {
    Merch_id: req.body.Merch_id, 
    Merch_type: req.body.Merch_type,
    Merch_name: req.body.Merch_name,
    Merch_price: req.body.Merch_price,
    Merch_count: req.body.Merch_count

  };
  let sql = 'INSERT INTO merchandise SET ?';
  let query = db.query(sql, merchandise, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'merchandise Created' });
  });
});

// post piercing
app.post('/piercing', (req, res) => {
  let piercing = {
    Pierce_no: req.body.Pierce_no, 
    Cust_id: req.body.Cust_id,
    Pierce_type: req.body.Pierce_no,
    Price: req.body.Price,
    Equip_id: req.body.Equip_id

  };
  let sql = 'INSERT INTO piercing SET ?';
  let query = db.query(sql, piercing, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Piercing Created' });
  });
});

// post result
app.post('/result', (req, res) => {
  let result = {
    Result_id: req.body.Result_id, 
    Shop_id: req.body.Shop_id,
    Cust_id: req.body.Cust_id,
    Artist_id: req.body.Artist_id,
    Res_type: req.body.Res_type,
    Res_date: req.body.Res_date,
    Start_time: req.body.Start_time,
    End_time: req.body.End_time

  };
  let sql = 'INSERT INTO result SET ?';
  let query = db.query(sql, result, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Result Created' });
  });
});

// post tatoo
app.post('/tattoo', (req, res) => {
  let tattoo = {
    Tat_no: req.body.Tat_no, 
    Cust_id: req.body.Cust_id,
    Color: req.body.Color,
    Size: req.body.Size,
    Est_time: req.body.Est_time,
    Shop_id: req.body.Shop_id,
    Equip_id: req.body.Equip_id


  };
  let sql = 'INSERT INTO tattoo SET ?';
  let query = db.query(sql, tattoo, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Tattoo Set' });
  });
});

// post waiver policy
app.post('/waiverpolicy', (req, res) => {
  let waiver_policy = {
    Pol_id: req.body.Pol_id, 
    Pol_signed: req.body.Pol_signed,
    Pol_date: req.body.Pol_date,
    Cust_id: req.body.Cust_id

  };
  let sql = 'INSERT INTO waiver_policy SET ?';
  let query = db.query(sql, waiver_policy, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.status(200).json({ success: 'Waiver Policy Created' });
  });
});

//app.use('/addreservation');

// // Select posts

// get reservations
app.get('/getreservation', (reg, res) => {
  let sql = 'SELECT * FROM reservation';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select artists
app.get('/getartists', (reg, res) => {
  let sql = 'SELECT * FROM artist';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select customer accounts
app.get('/getcustomeraccount', (reg, res) => {
  let sql = 'SELECT * FROM customer_account';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// get managers
app.get('/getmanager', (reg, res) => {
  let sql = 'SELECT * FROM manager';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// get manager accounts
app.get('/getmanageraccount', (reg, res) => {
  let sql = 'SELECT * FROM manager_account';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select merchandise
app.get('/getmerchandise', (reg, res) => {
  let sql = 'SELECT * FROM merchandise';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select piercings
app.get('/getpiercing', (reg, res) => {
  let sql = 'SELECT * FROM piercing';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select results
app.get('/getresult', (reg, res) => {
  let sql = 'SELECT * FROM result';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select tattoos
app.get('/gettattoo', (reg, res) => {
  let sql = 'SELECT * FROM tattoo';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

// select waiver policies
app.get('/getwaiverpolicy', (reg, res) => {
  let sql = 'SELECT * FROM waiver_policy';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ results });
  });
});

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
