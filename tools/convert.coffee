fs       = require 'fs'
readline = require('readline')

output = "dictionary-gr.js"
start  = "module.exports = [";
end    = "''];";

fs.writeFile output, start, (err)->
  return err

read = readline.createInterface(
  input: fs.createReadStream("el_GR.dic")
  output: process.stdout
  terminal: false)

read.on 'line', (line) ->
  line = line.replace(/\/.+/,"")
  console.log "'#{line}',"
  fs.appendFile output, "'#{line}',", (err)->
    return err

read.on 'close', ->
  console.log 'Finished parsing...'
  fs.appendFile output, end, (err)->
    return err
