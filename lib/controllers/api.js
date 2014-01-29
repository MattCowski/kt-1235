'use strict';

var mongoose = require('mongoose'),
    Thing = mongoose.model('Thing');

/**
 * Get awesome things
 */
exports.awesomeThings = function(req, res) {
  return Thing.find(function (err, things) {
    if (!err) {
      return res.json(things);
    } else {
      return res.send(err);
    }
  });
};

exports.message = function(req, res) {
  res.send('Hello World');
};


var crypto = require('crypto');

var utcDateString = function(time) {
  function pad(val, len) {
    val = String(val);
    len = len || 2;
    while (val.length < len) val = "0" + val;
    return val;
  }

  var now = new Date();
  now.setTime(time);

  var utc = new Date(
    Date.UTC(
      now.getFullYear(),
      now.getMonth(),
      now.getDate(),
      now.getHours(),
      now.getMinutes(),
      now.getSeconds()
    )
  );

  var cDate  = utc.getDate();
  var cMonth = utc.getMonth();
  var cYear  = utc.getFullYear();
  var cHour  = utc.getHours();
  var cMin   = utc.getMinutes();
  var cSec   = utc.getSeconds();

  var result = cYear + '/' + pad((cMonth + 1)) + '/' + pad(cDate);
  result += ' ' + pad(cHour) + ':' + pad(cMin) + ':' + pad(cSec) + '+00:00';

  return result;
};

// 3 hours from now (this must be milliseconds)
var expiresIn  = 3 * 60 * 60 * 1000;
var expires    = utcDateString((+new Date()) + expiresIn);

var authKey    = '2629128085a911e3b3e3a539a6199a02';
var authSecret = '853141bfb3546d86df4cc6ca7d6290a4c79a1434';

var params = {
  'auth': {
    'expires': expires,
    'key': authKey
  }
  // your other params like template_id, notify_url, etc.
};
var paramsString = JSON.stringify(params);

var signature = crypto
    .createHmac('sha1', authSecret)
    .update(new Buffer(paramsString, 'utf-8'))
    .digest('hex');

console.log("sig:"+signature);

exports.signature = function(req, res) {
  res.send(signature);
};


// var transloadit = require('node-transloadit');

// var client = new transloadit('AUTH_KEY', 'AUTH_SECRET');

// client.addStream(name, stream);
// client.addFile(file_name, file_path);
// client.send(params, ok_callback, fail_callback);

// var transloadit = require('node-transloadit');

// var client = new transloadit('AUTH_KEY', 'AUTH_SECRET');
// var params = {
//     steps: {
//         ':original': {
//             robot: '/http/import',
//             url: 'http://example.com/file.mov'
//         }
//     },
//     template_id: 'your_template_id_here'
// };

// client.send(params, function(ok) {
//     // success callback [optional]
//     console.log('Success: ' + JSON.stringify(ok));
// }, function(err) {
//     // error callback [optional]
//     console.log('Error: ' + JSON.stringify(err));
// });