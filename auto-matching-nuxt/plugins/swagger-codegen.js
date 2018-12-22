const swaggerGen = require('swagger-vue')
const fs = require('fs')
const path = require('path')
const jsonData = require('../swagger.json')

const opt = {
  swagger: jsonData,
  moduleName: 'api',
  className: 'api'
}
const codeResult = swaggerGen(opt)
fs.writeFileSync(path.join(__dirname, './api.js'), codeResult)
