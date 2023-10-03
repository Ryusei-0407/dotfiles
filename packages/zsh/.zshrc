export HOMEBREW_CACHE=/opt/homebrew/cache
export CARGO_PATH=$HOME/.cargo/bin
export RUSTC_WRAPPER=/opt/homebrew/bin/sccache
export GO111MODULE=on export GOBIN=$HOME/go/bin
export GOMODCACHE=$HOME/.cache/go_mod
export GEM_HOME=$HOME/.gem
export PKG_CONFIG_PATH=/opt/homebrew/opt/ruby/lib/pkgconfig
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH" export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/homebrew/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$CARGO_PATH
export PATH=$PATH:$GOBIN
export PATH=/opt/homebrew/opt/openssl@1.1/bin:$PATH
export PATH=$GEM_HOME/bin:$PATH
export PATH=$HOME/.krew/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
export PATH=/opt/homebrew/opt/make/libexec/gnubin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

alias zshconf='vi $HOME/.zshrc'
alias zshrc='source $HOME/.zshrc'
alias yabaiconf='vi $HOME/.config/yabai/yabairc'
alias skhdconf='vi $HOME/.config/skhd/skhdrc'
alias tell='say -v Samantha "done"'
alias e='emacs'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias c='code-insiders'
alias bat='bat --theme=Dracula'
alias j='z'
alias a='cd ..'
alias ls='eza --git --icons'
alias ll='eza -l --no-user --git --icons'
alias lla='eza -la --no-user --git --icons'
alias la='eza -a --git --icons'
alias tree='eza --tree --git-ignore --git --icons'
alias cp='cp -c'
alias cut='choose'
alias mkdir='mkdir -p'
alias lg='lazygit'
alias md='frogmouth'
alias csv='csview'
alias hex='hexyl'
alias grep='rg'
alias find='fd'
alias ps='btop'
alias nsl='nslookup'
alias pb='pbcopy'
alias m='make'
alias docker='finch'
alias dps='finch ps'
alias dimg='finch images'
alias up='finch compose up -d'
alias down='finch compose down'
alias dprune='yes | finch volume prune && yes | finch system prune --all'
alias glog='git log --oneline --graph'
alias opensim='open -a Simulator'
alias dotfiles='$HOME/dotfiles/install.sh'
alias vm='tart'

if [[ -x "$(command -v arch)" ]]; then
  alias x64='arch -x86_64 bash'
fi

if [[ -x "$(command -v wezterm)" ]]; then
  alias img='wezterm imgcat'
fi

bindkey \^U backward-kill-line

function source {
  zcompile $1
  builtin source $1
}

function ensure_zcompiled {
  local compiled="$1.zwc"
  if [[ ! -f $compiled || $1 -nt $compiled ]]; then
    zcompile $1
  fi
}

ensure_zcompiled ~/.zshrc

if [[ ! -r ~/.config/sheldon/sheldon.zsh|| ~/.config/sheldon/plugins.toml -nt ~/.config/sheldon/sheldon.zsh ]]; then
  sheldon source > ~/.config/sheldon/sheldon.zsh
  source ~/.config/sheldon/sheldon.zsh
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f ~/.config/op/plugins.sh ]]; then
  source ~/.config/op/plugins.sh
fi

if [[ -f ~/fzf.zsh ]]; then
  source ~/fzf.zsh
fi

if [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

eval "$(sheldon source)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

zstyle :compinstall filename '~/.zshrc'
