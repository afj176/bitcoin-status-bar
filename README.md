# Bitcoin Status Bar

Display bitcoin conversion in Atom status bar.

![Bitcoin Status Bar ScreenShot](https://raw.github.com/afj176/bitcoin-status-bar/master/styles/screenshot.png)


##Installing

1. Go to `Atom -> Preferences...`
2. Then select the `Packages` tab
3. Enter `bitcoin-status-bar` in the search box

#### Using apm

```sh
$ apm install bitcoin-status-bar
```

#### Install using Git

Alternatively, if you are a git user, you can install the package and keep up to date by cloning the repo directly into your `~/.atom/packages` directory.


```sh
$ git clone https://github.com/afj176/bitcoin-status-bar/ ~/.atom/packages/bitcoin-status-bar
```

#### Download Manually

1. Download the files using the [GitHub .zip download](https://github.com/afj176/bitcoin-status-bar/archive/master.zip) option and unzip them
3. Move the `bitcoin-status-bar` folder to `~/.atom/packages`



## Usage

Display your local bitcoin rate in your status bar.


#### Plugin settings page

To access the Bitcoin Status Bar Settings:

1. Go to `Atom -> Preferences...` or `cmd-,`
2. In the `Filter Packages` type `bitcoin-status-bar`

![Settings](https://raw.github.com/afj176/bitcoin-status-bar/master/styles/settings.png)

Bitcoin Status Bar has 5 settings that can be edited:

1. Code | default:`USD`
2. Currency | default:`on`
3. Display | default: `left`
4. Icon | default:`atom://bitcoin-status-bar/styles/bitcoin.svg`
5. Refresh | default: `61` (if zero minutes only refreshes when open/close windows or trigger refresh)


### Commands

The following commands are available and are keyboard shortcuts.

* `bitcoin-status-bar:toggle` - Toggle - `ctrl-alt-b` `ctrl-alt-b`
* `bitcoin-status-bar:refresh` - Refresh - `ctrl-alt-r` `ctrl-alt-r`


### [Flex Tool Bar](https://atom.io/packages/flex-tool-bar) integration (optional)

![Bitcoin Status Bar ScreenShot](https://raw.github.com/afj176/bitcoin-status-bar/master/styles/flex-toolbar-usage.png)

Follow instructions for [Flex Tool Bar](https://atom.io/packages/flex-tool-bar)

then add to ~/atom/toolbar.json
```
[
  {
    "type": "button",
    "icon": "btc",
    "tooltip": "Bitcoin",
    "iconset": "fa",
    "callback": "bitcoin-status-bar:toggle",
    "style": {
      "color": "#f1c300"
    }
  },
  //....... other buttons
]
```



Feel free fork, contribute, to open an issue to discuss potential features to add or improve.
