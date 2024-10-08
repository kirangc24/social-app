const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const app = express();
const port = 3000;

// MySQL connection setup
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Mrscool@155',
    database: 'social_app'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// Routes
app.use('/user', require('./routes/user'));

// Start server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
