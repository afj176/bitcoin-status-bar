bit = require './bitcoin'
getSymbol = require('currency-symbol-map')
{CompositeDisposable} = require 'atom'
subscriptions = new CompositeDisposable


class BitcoinView extends HTMLDivElement
  initialize: (@statusBar) ->

    subscriptions.add atom.commands.add 'atom-workspace', 'bitcoin-status-bar:toggle': =>
      @toggle()

    subscriptions.add atom.commands.add 'atom-workspace', 'bitcoin-status-bar:refresh': =>
      @build()

    @observeCode = atom.config.observe 'bitcoin-status-bar.code', (newValue, previous) =>
      @build()
    @observeDisplay = atom.config.observe 'bitcoin-status-bar.display', (newValue, previous) =>
      @build()
    @observeIcon = atom.config.observe 'bitcoin-status-bar.icon', (newValue, previous) =>
      @build()
    @observeCurrency = atom.config.observe 'bitcoin-status-bar.currency', (newValue, previous) =>
      @build()

    @initEls()

  initEls: ->
    @classList.add('bitcoin-box', 'inline-block')
    @setAttribute "id", "bitcoin-status-bar"
    @icon = document.createElement "img"
    @icon.classList.add "bitcoin-icon"
    @icon.src = atom.config.get('bitcoin-status-bar.icon')
    @equals = document.createElement "span"
    @one = document.createElement "span"
    @eq = document.createElement "span"
    @bitcoin = document.createElement "span"
    @bitcoin.setAttribute "id", "bitcoin"
    @price = document.createElement "span"
    @currency = document.createElement "span"
    @bitcoin.classList.add "currency", "inline-block-tight"
    @one.textContent = "1 "
    @equals.appendChild(@one)
    @equals.appendChild(@icon)
    @eq.textContent = " = "
    @equals.appendChild(@eq)
    @appendChild(@equals)

  attach: ->
    @build()
    #subscriptions.add atom.packages.once('activated', @attach)
    minutes = atom.config.get 'bitcoin-status-bar.refresh'

    if minutes > 0
      refresh = minutes * 60 * 1000
      setInterval (=>
        @build()
      ), refresh

  toggle: ->
    if @hasParent() then @detach() else @attach()

  hasParent: ->
    has = false
    bar = document.getElementsByTagName "bitcoin-status-bar"
    if bar != null
      if bar.item() != null
        has = true
    return has

  detach: ->
    bar = document.getElementsByTagName "bitcoin-status-bar"
    if bar != null
      if bar.item() != null
        el = bar[0]
        parent = el.parentNode
        if parent != null
          parent.removeChild el

  destroy: ->
    @tile?.destroy()
    @detach()

  build: =>
    code = atom.config.get('bitcoin-status-bar.code')
    currency = atom.config.get('bitcoin-status-bar.currency')

    bit code, (coin) =>
      @price.textContent = coin.rate

      if currency == "on"
        @currency.textContent = getSymbol(code)
      else
        @currency.textContent = ""

      @bitcoin.appendChild @currency
      @bitcoin.appendChild @price
      @appendChild(@bitcoin)
      if atom.config.get('bitcoin-status-bar.display') == "left"
        @tile = @statusBar.addLeftTile(priority: 100, item: this)
      else
        @tile = @statusBar.addRightTile(priority: 100, item: this)

      return

module.exports = document.registerElement('bitcoin-status-bar', prototype: BitcoinView.prototype)
