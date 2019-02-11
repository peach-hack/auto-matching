const exec = require('child_process').exec;

const response = {
  statusCode: 200,
  body: JSON.stringify('Hello from Lambda!'),
};

exports.handler = (request, response) => {
  exec('./script.sh', function (err, stdout, stderr) {
    if (err) { console.log(err); }
  });
  return response;
};
