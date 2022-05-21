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
export JAVA_HOME=$(/usr/libexec/java_home)
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

# alias
alias zshconf='vi ~/.zshrc'
alias zshrc='source ~/.zshrc'
alias yabaiconf='vi ~/.config/yabai/yabairc'
alias skhdconf='vi ~/.config/skhd/skhdrc'
alias vi='nvim'
alias vim='nvim --noplugin -u ~/dotfiles/packages/config/nvim/min-init.lua'
alias j='z'
alias ls='exa --git --icons'
alias ll='exa -l --no-user --git --icons'
alias lla='exa -la --no-user --git --icons'
alias la='exa -a --git --icons'
alias tree='exa --tree --git --icons'
alias mkdir='mkdir -p'
alias md='mdr'
alias csv='csview'
alias hex='hexyl'
alias img='viu'
alias grep='rg'
alias find='fd'
alias wget='pget -p 6'
alias ps='btm'
alias htop='btm -b'
alias nsl='nslookup'
alias pb='pbcopy'
alias pass='pwgen 20 1'
alias figlet='figlet -f slant'
alias siri='silicon'
alias ng='ngrok'
alias btop='bpytop'
alias m='make'
alias gcc='gcc-11'
alias g++='g++-11'
alias py2='python'
alias py3='/opt/homebrew/bin/python3.9'
alias pip='pip3'
alias dps='docker ps'
alias dimg='docker images'
alias up='docker compose up -d'
alias down='docker compose down'
alias tf='terraform'
alias ga='git add'
alias glog='git log --oneline --graph'
alias ginit='git init && git add . && git commit -m "initial commit"'
alias opensim='open -a Simulator'
alias awsp='source _awsp'
alias dotfiles='~/dotfiles/install.sh'
# kitty
alias icat='kitty +kitten icat'
# M1
alias x64='arch -x86_64 bash'
# Substrate
alias substrate='open "https://paritytech.github.io/contracts-ui/#/add-contract" && substrate-contracts-node --dev'
# Astar
alias astar='open "https://polkadot.js.org/apps/?rpc=ws%3A%2F%2F127.0.0.1%3A9944#/explorer" && astar-collator --port 30333 --ws-port 9944 --rpc-port 9933 --rpc-cors all --alice --dev'
    
bindkey \^U backward-kill-line
     
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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryuseifujiwara/Sandbox/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ryuseifujiwara/Sandbox/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryuseifujiwara/Sandbox/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ryuseifujiwara/Sandbox/google-cloud-sdk/completion.zsh.inc'; fi
