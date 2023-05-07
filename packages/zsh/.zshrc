# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_CACHE=/opt/homebrew/cache
export CARGO_PATH=$HOME/.cargo/env
export RUSTC_WRAPPER=/opt/homebrew/bin/sccache
export GO111MODULE=on
export GOBIN=$HOME/go/bin
export GOMODCACHE=$HOME/.cache/go_mod
export GEM_HOME=$HOME/.gem
export PKG_CONFIG_PATH=/opt/homebrew/opt/ruby/lib/pkgconfig
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
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

# alias
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
alias j='z'
alias a='cd ..'
alias ls='exa --git --icons'
alias ll='exa -l --no-user --git --icons'
alias lla='exa -la --no-user --git --icons'
alias la='exa -a --git --icons'
alias tree='exa --tree --git --icons'
alias cp='cp -c'
alias cut='choose'
alias mkdir='mkdir -p'
alias lg='lazygit'
alias md='frogmouth'
alias csv='csview'
alias hex='hexyl'
alias grep='rg'
alias find='fd'
alias ps='btm'
alias nsl='nslookup'
alias pb='pbcopy'
alias m='make'
alias docker='finch'
alias dps='finch ps'
alias dimg='finch images'
alias up='finch compose up -d'
alias down='finch compose down'
alias dprune='yes | finch volume prune && yes | finch system prune --all'
alias tf='terraform'
alias glog='git log --oneline --graph'
alias opensim='open -a Simulator'
alias dotfiles='$HOME/dotfiles/install.sh'
alias vm='tart'

# M1
if [ -x "$(command -v arch)" ]; then
    alias x64='arch -x86_64 bash'
fi

# imgcat
if [ -x "$(command -v wezterm)" ]; then
    alias img='wezterm imgcat'
fi
    
bindkey \^U backward-kill-line
     
source /Users/ryu/.config/op/plugins.sh
autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryu/repo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ryu/repo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryu/repo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ryu/repo/google-cloud-sdk/completion.zsh.inc'; fi
