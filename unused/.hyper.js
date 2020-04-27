module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // border color (window, tabs)
    borderColor: '#000',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    // padding: '12px 14px',

    commands: ['tmux attach -t default || tmux new -s default'],

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg

    overlay: {
      alwaysOnTop: true,
      animate: false,
      hasShadow: false,
      hideDock: true,
      hideOnBlur: false,
      hotkeys: ['Control+`'],
      position: 'bottom',
      primaryDisplay: false,
      resizable: false,
      startAlone: true,
      startup: true,
      size: 1.0,
      tray: false,
      unique: true
    },
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  plugins: [
    "hyperterm-atom-dark",
    'hyperterm-overlay',
    'hyper-startup'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    // "hyperterm-gruvbox-dark",
  ]
};
