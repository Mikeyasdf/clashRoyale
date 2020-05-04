/* App Configuration */
var express = require('express');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var session = require('express-session');
var bcrypt = require('bcrypt');
var app = express();
const request = require('request');
const ejsLint = require('ejs-lint');
// var jsdom = require("jsdom");
// const { JSDOM } = jsdom;
// const { window } = new JSDOM();
// const { document } = (new JSDOM('')).window;
// global.document = document;
// var $ = require('jquery')(window);

app.set('view engine', 'ejs');

app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));
app.use(session({
    secret: 'top secret code!',
    resave: true,
    saveUninitialized: true
}));

/* Configure MySQL DBMS */
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'miguelespitia',
    password: 'miguelespitia',
    database: 'clashRoyale_db',
    multipleStatements: true
});
connection.connect();

/* Middleware */
function isAuthenticated(req, res, next){
    if(!req.session.authenticated) res.redirect('/login');
    else next();
}

function checkUsername(username){
    let stmt = 'SELECT * FROM users WHERE username=?';
    return new Promise(function(resolve, reject){
       connection.query(stmt, [username], function(error, results){
           if(error) throw error;
           resolve(results);
       }); 
    });
}

function checkPassword(password, hash){
    return new Promise(function(resolve, reject){
       bcrypt.compare(password, hash, function(error, result){
          if(error) throw error;
          resolve(result);
       }); 
    });
}

/* Home Route*/
app.get('/', function(req, res){
    res.render('home');
});

/* Login Routes */
app.get('/login', function(req, res){
    res.render('login');
});

app.post('/login', async function(req, res){
    let isUserExist = await checkUsername(req.body.username);
    let hashedPasswd = isUserExist.length > 0 ? isUserExist[0].password : '';
    let passwordMatch = await checkPassword(req.body.password, hashedPasswd);
    if(passwordMatch){
        //console.log(req);
        //console.log(isUserExist);
        req.session.authenticated = true;
        req.session.user = isUserExist[0].username;
        res.redirect('/myDeck');
    }
    else{
        res.render('login', {error: true});
    }
});

/* Register Routes */
app.get('/register', function(req, res){
    res.render('register');
});

app.post('/register', function(req, res){
    let salt = 10;
    bcrypt.hash(req.body.password, salt, function(error, hash){
        if(error) throw error;
        let stmt = 'INSERT INTO users (username, password) VALUES (?, ?);';
        let stmt2 = 'INSERT INTO createDeck (username, card1, card2, card3, card4, card5, card6, card7, card8, offenseRating, defenseRating) VALUES ("' + req.body.username + '", 11, 11, 11, 11, 11, 11, 11, 11, 1, 1);';
        let data = [req.body.username, hash];
        connection.query(stmt2, function(error, result){
            if(error) throw error;
        });
        connection.query(stmt, data, function(error, result){
           if(error) throw error;
           res.redirect('/login');
        });
    });
});

/* Logout Route */
app.get('/logout', function(req, res){
   req.session.destroy();
   res.redirect('/');
});

app.get('/cards', function(req, res){
    res.render('cards');
});

/* Cards Chosen */
app.get('/cardsResult', function(req, res){
    
    let stmt = "SELECT * FROM totCards WHERE rarity='" + req.query.rarity + "' AND cost='" + req.query.cost + "' AND category='" + req.query.type + "';";
    
    //let stmt = "SELECT * FROM totCards";
    //SELECT * FROM totCards WHERE rarity = "Common" AND cost = "3" AND category = "spell";
    
    connection.query(stmt, function(error, result){
        if(error) throw error;
        console.log(result);
        if(result.length){
            res.render('cardsResult', {result:result}); //, {user: req.session.user, result: result}
        }else{
            res.render('noCardFound');
        }
    });
    //res.render('cards');
});

/* Welcome Route */
app.get('/myDeck', isAuthenticated, function(req, res){
    
    //, createDeck WHERE createDeck.username="' + req.session.user + '"'
    //var stmt = 'SELECT * FROM totCards, createDeck WHERE createDeck.username="' + req.session.user + '";';
    var stmt = 'SELECT * FROM totCards; SELECT * FROM createDeck where createDeck.username="' + req.session.user + '";';
    //var stmt2 = 'SELECT * FROM createDeck WHERE createDeck.username="' + req.session.user + '";';

    connection.query(stmt, function(error, result){
        if(error) throw error;
        let res1 = result[0];
        let res2 = result[1];
        //console.log(res2[0].username);
        //console.log(res2[0].card1);
        ejsLint('myDeck');
        res.render('myDeck', {user: req.session.user, result: res1, result2:res2[0]}); 
    });
    
});

app.post('/myDeck', isAuthenticated, function(req, res){
    let card1 = req.body.card1;
    //console.log("This is card1: " + card1);
    let card2 = req.body.card2;
    let card3 = req.body.card3;
    let card4 = req.body.card4;
    let card5 = req.body.card5;
    let card6 = req.body.card6;
    let card7 = req.body.card7;
    let card8 = req.body.card8;
    //console.log("This is card1: " + card1);
    var stmt = "UPDATE createDeck SET card1=" + card1 + ", card2=" + card2 + ", card3=" + card3 + ", card4=" + card4 + ", card5=" + card5 + ", card6=" + card6 + ", card7=" + card7 + ", card8=" + card8 + ' WHERE username="' + req.session.user + '"';
    //console.log(stmt);
    connection.query(stmt, function(error, result){
        if(error) throw error;
        res.redirect('/myDeckUpdated');
    });
});

app.get('/myDeckUpdated', isAuthenticated, function(req, res){
    res.render('updated', {user: req.session.user}); 
});

app.get('/deleteAccount', isAuthenticated, function(req, res){
    var stmt = "DELETE FROM createDeck WHERE username='" + req.session.user + "'; DELETE FROM users WHERE username = '" + req.session.user + "';";
    
    connection.query(stmt, function(error, result) {
       if(error) throw error;
       req.session.destroy;
       res.redirect('/');
    });
});


app.get('/reddit', function(req, res) {
    res.render('reddit');
});

/* Error Route*/
app.get('*', function(req, res){
    res.render('error'); 
});

app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
});
