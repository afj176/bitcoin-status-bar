'use strict'
https = require('https')

bitcoin = (code, cb) ->

  get = (r) ->
    bd = ''
    r.on('data', (d) ->
      bd += d
      return
    ).on 'end', ->
      b = JSON.parse(bd)
      cb b
      return
    return

  https.get {
    host: 'bitpay.com'
    path: '/api/rates/' + code
  }, get

module.exports = bitcoin
