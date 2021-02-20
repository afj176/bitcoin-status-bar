bitcoin = null

module.exports =
  config:
    code:
      type: 'string'
      default: 'USD'
      enum: require './codes'
    display:
      type: 'string'
      default: 'right'
      enum: ["left", "right"]
    currency:
      type: 'string'
      default: 'on'
      enum: ["on", "off"]
    refresh:
      type: 'integer'
      default: 60
    icon:
      type: 'string'
      default: "atom://bitcoin-status-bar/styles/bitcoin.svg"

  activate: ->
    console.log "activate"
  deactivate: ->
    bitcoin?.destroy()
    bitcoin = null

  consumeStatusBar: (statusBar) ->
    BitcoinView = require './bitcoin-view'
    bitcoin = new BitcoinView()
    bitcoin.initialize(statusBar)
    bitcoin.attach()
