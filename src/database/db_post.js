const connect = require('./db_connect');
const construct = require('../helper_functions/answer_objects');
const searchAnsObjects = require('../helper_functions/searchAnsObjects');

const post = {};

post.userDetails = (userDetails, senderID, callback) => {
  const checkIfUserExists = 'SELECT facebook_id FROM users WHERE facebook_id = $1;';
  connect.query(checkIfUserExists, [userDetails.facebook_id], (err, user) => {
    if (err) { return callback(err); }

    if (!user.rows[0]) {
      connect.query('INSERT INTO users (firstname, lastname, facebook_id) VALUES ($1, $2, $3)', [userDetails.firstname, userDetails.lastname, userDetails.facebook_id],
      (err, res) => {
        if (err) {
          return callback(err);
        }
        const newUser = 'yes';
        callback(null, res, newUser);
      });
      // const placeholderVotingObj = { party: null, issue: null, inFavour: null, against: null, turnout: null };
      // construct(placeholderVotingObj, null, null, null, senderID, 'FACEBOOK_WELCOME', searchAnsObjects);
    } else {
      callback(null, user);
    }
  });
};

post.userPostcode = (userPostcode, callback) => {
  connect.query(`UPDATE users SET postcode = '${userPostcode.postcode}' WHERE facebook_id = ${userPostcode.facebook_id}`, (err, res) => {
    if (err) return callback(err);

    callback(null, res);
  });
};


post.persistingCtxts = (contexts, facebook_id, callback) => {
  connect.query(`UPDATE users SET persistingCtxts = '{${contexts}}' WHERE facebook_id = ${facebook_id}`, (err, res) => {
    if (err) return callback(err);
    callback(null, res);
  });
};

post.party = (contexts, facebook_id, callback) => {
  if (contexts !== 'Back to votes' && contexts !== 'Back to parties') {
    connect.query(`UPDATE users SET party = '{${contexts}}' WHERE facebook_id = ${facebook_id}`, (err, res) => {
      if (err) return callback(err);
      callback(null, res);
    });
  }
};

post.issue = (contexts, facebook_id, callback) => {
  connect.query(`UPDATE users SET issue = '{${contexts}}' WHERE facebook_id = ${facebook_id}`, (err, res) => {
    if (err) return callback(err);
    callback(null, res);
  });
};

post.userConstituency = (userConstituency, callback) => {
  connect.query(`UPDATE users SET constituency = '${userConstituency.constituency}' WHERE facebook_id = ${userConstituency.facebook_id}`, (err) => {
    if (err) return callback(err);
    return callback();
  });
};

module.exports = post;
