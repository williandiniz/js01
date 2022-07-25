const jsreport = require('jsreport')()

if (process.env.JSREPORT_CLI) {
  // export jsreport instance to make it possible to use jsreport-cli
  module.exports = jsreport
} else {
  jsreport.init().then(() => {
    // running
    console.log("funcionando")

  }).catch((e) => {
    // error during startup
    console.log("nao funcionando")
    console.error(e.stack)
    process.exit(1)
  })
}
