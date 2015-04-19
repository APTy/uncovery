var models = require('../db/models.js');
var io;
var connections = {};

var events = {
  //input: {userToken: string}
  init: function(data) {
    connections[data.userToken] = this;
    this.emit('init');
  },

  //input: {userToken: string, messageId: string}
  upvote: function(data) {
    models.createVote(data)
    .then(function(success) {
      return models.retrieveUserScore(data.userToken);
    }).then(function(user) {
      exports.sendUserScore(user[0]);
    });
  },

  disconnect: function() {
    console.log('user disconnected');
  }
};

exports.initialize = function(server) {
  io = server;
  io.on('connection', function(socket) {
    for (var e in events) {
      socket.on(e, events[e]);
    }
  });
};

exports.sendUserScore = function(user) {
  connections[user.token].emit('score', {score: user.total_votes});
};