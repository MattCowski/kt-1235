// var nodemailer = require("nodemailer");

// // create reusable transport method (opens pool of SMTP connections)
// var smtpTransport = nodemailer.createTransport("SMTP",{
//     service: "Gmail",
//     auth: {
//         user: "gmail.user@gmail.com",
//         pass: "userpass"
//     }
// });

// // setup e-mail data with unicode symbols
// var mailOptions = {
//     from: "Fred Foo ✔ <foo@blurdybloop.com>", // sender address
//     to: "bar@blurdybloop.com, baz@blurdybloop.com", // list of receivers
//     subject: "Hello ✔", // Subject line
//     text: "Hello world ✔", // plaintext body
//     html: "<b>Hello world ✔</b>" // html body
// }

// // send mail with defined transport object
// smtpTransport.sendMail(mailOptions, function(error, response){
//     if(error){
//         console.log(error);
//     }else{
//         console.log("Message sent: " + response.message);
//     }

//     // if you don't want to use this transport object anymore, uncomment following line
//     //smtpTransport.close(); // shut down the connection pool, no more messages
// });

// // ----------------------------------

// var Emailer, emailer, exports, fs, _;

// emailer = require("nodemailer");

// fs = require("fs");

// _ = require("underscore");

// Emailer = (function() {

//   Emailer.prototype.options = {};

//   Emailer.prototype.data = {};

//   Emailer.prototype.attachments = [
//     {
//       fileName: "logo.png",
//       filePath: "./public/images/email/logo.png",
//       cid: "logo@myapp"
//     }
//   ];

//   function Emailer(options, data) {
//     this.options = options;
//     this.data = data;
//   }

//   Emailer.prototype.send = function(callback) {
//     var attachments, html, messageData, transport;
//     html = this.getHtml(this.options.template, this.data);
//     attachments = this.getAttachments(html);
//     messageData = {
//       to: "'" + this.options.to.name + " " + this.options.to.surname + "' <" + this.options.to.email + ">",
//       from: "'Myapp.com'",
//       subject: this.options.subject,
//       html: html,
//       generateTextFromHTML: true,
//       attachments: attachments
//     };
//     transport = this.getTransport();
//     return transport.sendMail(messageData, callback);
//   };

//   Emailer.prototype.getTransport = function() {
//     return emailer.createTransport("SMTP", {
//       service: "Gmail",
//       auth: {
//         user: "myappemail@gmail.com",
//         pass: "secretpass"
//       }
//     });
//   };

//   Emailer.prototype.getHtml = function(templateName, data) {
//     var encoding, templateContent, templatePath;
//     templatePath = "./views/emails/" + templateName + ".html";
//     templateContent = fs.readFileSync(templatePath, encoding = "utf8");
//     return _.template(templateContent, data, {
//       interpolate: /\{\{(.+?)\}\}/g
//     });
//   };

//   Emailer.prototype.getAttachments = function(html) {
//     var attachment, attachments, _i, _len, _ref;
//     attachments = [];
//     _ref = this.attachments;
//     for (_i = 0, _len = _ref.length; _i < _len; _i++) {
//       attachment = _ref[_i];
//       if (html.search("cid:" + attachment.cid) > -1) {
//         attachments.push(attachment);
//       }
//     }
//     return attachments;
//   };

//   return Emailer;

// })();

// exports = module.exports = Emailer;
