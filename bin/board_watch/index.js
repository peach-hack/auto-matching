const exec = require('child_process').exec;

exports.boardWatch = (request, response) => {
  exec('./script.sh', function (err, stdout, stderr) {
    if (err) { console.log(err); }
  });
  response.status(200).end();
};

