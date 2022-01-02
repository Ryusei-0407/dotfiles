eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export HOMEBREW_CACHE="/opt/homebrew/cache"
export GO11MODULE=on
export GOBIN=$HOME/go/bin
export GOMODCACHE=$HOME/.cache/go_mod
export JAVA_HOME=$(/usr/libexec/java_home)
export GEM_HOME=$HOME/.gem
export PKG_CONFIG_PATH=/opt/homebrew/opt/ruby/lib/pkgconfig
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
export PATH=$PATH:$GOBIN
export PATH=/opt/homebrew/opt/openssl@1.1/bin:$PATH
export PATH=$GEM_HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.krew/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
export PATH=/opt/homebrew/opt/make/libexec/gnubin:$PATH

# alias
alias zshconf='vi ~/.zshrc'
alias zshrc='source ~/.zshrc'
alias yabaiconf='vi ~/.config/yabai/yabairc'
alias skhdconf='vi ~/.config/skhd/skhdrc'
alias vi='nvim'
alias vim='nvim --noplugin -u ~/dotfiles/packages/config/nvim/min-init.lua'
alias j='z'
alias ls='exa --git --icons'
alias ll='exa -l --git --icons'
alias lla='exa -la --git --icons'
alias la='exa -a --git --icons'
alias tree='exa --tree --git --icons'
alias md='mdr'
alias csv='csview'
alias hex='hexyl'
alias img='viu'
alias grep='rg'
alias find='fd'
alias ps='btm'
alias htop='btm -b'
alias nsl='nslookup'
alias pb='pbcopy'
alias pass='pwgen 20 1'
alias figlet='figlet -f slant'
alias siri='silicon'
alias ng='ngrok'
alias btop='bpytop'
alias car='cargo'
alias rsc='rustc'
alias rsf='rustfmt'
alias py2='python'
alias py3='/opt/homebrew/bin/python3.9'
alias pip='pip3'
alias dps='docker ps'
alias dimg='docker images'
alias up='docker-compose up -d'
alias down='docker-compose down'
alias k='kubectl'
alias krew='kubectl krew'
alias tf='terraform'
alias ga='git add'
alias glog='git log --oneline --graph'
alias opensim='open -a Simulator'
alias dotfiles='~/dotfiles/install.sh'
# kitty
alias icat='kitty +kitten icat'
    
bindkey \^U backward-kill-line
   
# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
  
# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit
source <(kubectl completion zsh)
complete -o nospace -C /opt/homebrew/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
