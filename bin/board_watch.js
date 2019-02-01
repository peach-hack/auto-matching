const exec = require('child_process').exec;

module.exports.board_watch = function () {
  exec('./board_watch.sh', function (err, stdout, stderr) {
    if (err) { console.log(err); }
  });
}

module.exports.daily_post = function () {
  exec('./daily_post.sh', function (err, stdout, stderr) {
    if (err) { console.log(err); }
  });
}

