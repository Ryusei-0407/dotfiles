"use strict";

module.exports = {
    config: {
        updateChannel: 'stable',
        fontSize: 12,
        fontFamily: 'FiraCode Nerd Font',
        fontWeight: 'normal',
        fontWeightBold: 'bold',
        lineHeight: 1,
        letterSpacing: 0,
        cursorColor: 'rgba(248,28,229,0.8)',
        cursorAccentColor: '#000',
        // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
        cursorShape: 'BLOCK',
        cursorBlink: false,
        foregroundColor: '#fff',
        backgroundColor: '#000',
        selectionColor: 'rgba(248,28,229,0.3)',
        borderColor: '#333',
        // if you're using a Linux setup which show native menus, set to false
        // default: `true` on Linux, `true` on Windows, ignored on macOS
        showHamburgerMenu: '',
        padding: '12px 14px',
        colors: {
            black: '#22212C',
            red: '#FF9580',
            green: '#8AFF80',
            yellow: '#FFFF80',
            blue: '#9580FF',
            magenta: '#FF80BF',
            cyan: '#80FFEA',
            white: '#F8F8F2',
            lightBlack: '#6272A4',
            lightRed: '#FFAA99',
            lightGreen: '#A2FF99',
            lightYellow: '#FFFF99',
            lightBlue: '#AA99FF',
            lightMagenta: '#FF99CC',
            lightCyan: '#99FFEE',
            lightWhite: '#FFFFFF',
            limeGreen: '#32CD32',
            lightCoral: '#F08080',
        },
        shell: '/opt/homebrew/bin/zsh',
        shellArgs: ['--login'],
        env: {},
        bell: false,
        copyOnSelect: true,
        // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
        defaultSSHApp: true,
        // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
        // selection is present (`true` by default on Windows and disables the context menu feature)
        quickEdit: false,
        // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
        // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
        // (inside tmux or vim with mouse mode enabled for example).
        macOptionSelectionMode: 'vertical',
        // Whether to use the WebGL renderer. Set it to false to use canvas-based
        // rendering (slower, but supports transparent backgrounds)
        webGLRenderer: true,
        // keypress required for weblink activation: [ctrl|alt|meta|shift]
        // todo: does not pick up config changes automatically, need to restart terminal :/
        webLinksActivationKey: '',
        // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
        disableLigatures: true,
        // set to true to disable auto updates
        disableAutoUpdates: false,
        // set to true to enable screen reading apps (like NVDA) to read the contents of the terminal
        screenReaderMode: false,
        // set to true to preserve working directory when creating splits or tabs
        preserveCWD: true,
        // for advanced config flags please refer to https://hyper.is/#cfg
        termCSS: `
            x-screen a {
                color: blue;
            }
            x-screen a.hover {
                text-decoration: none;
            }
        `
    },
    plugins: [
        "hyper-highlight-active-pane",
        "hyper-search",
        "hyperterm-visor",
        "hyperlinks",
        "hyper-tab-icons"
    ],
    localPlugins: [],
    keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
    }
};
//# sourceMappingURL=config-default.js.map
