export HOMEBREW_CACHE=/opt/homebrew/cache
export GOPATH=$HOME/go
export JAVA_HOME=$(/usr/libexec/java_home)
export GEM_HOME=$HOME/.gem
export PKG_CONFIG_PATH=/opt/homebrew/opt/ruby/lib/pkgconfig
export PATH=$PATH:$GOPATH/bin
export PATH=/opt/homebrew/opt/openssl@1.1/bin:$PATH
export PATH=$GEM_HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.krew/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH

# alias
alias zshconf='vi ~/.zshrc'
alias t='tmux'
# alias y='yabai'
alias vi='nvim'
alias vim='nvim'
alias nv='neovide'
alias j='z'
alias ls='exa --icons --git'
alias ll='exa -l --icons --git'
alias lla='exa -la --icons --git'
alias la='exa -a --icons --git'
alias tree='exa --tree'
alias md='mdr'
alias csv='csview'
alias hex='hexyl'
alias img='viu'
alias grep='rg'
alias find='fd'
alias ps='procs'
alias pst='procs --tree'
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
alias up='docker-compose up -d'
alias down='docker-compose down'
alias k='kubectl'
alias krew='kubectl krew'
alias tf='terraform'
alias opensim='open -a Simulator'
alias dotfiles='~/dotfiles/install.sh'

# z
. /opt/homebrew/etc/profile.d/z.sh

eval $(ssh-agent)
macchina -H Host LocalIP

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# oh-my-zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

# Terminal
setopt promptsubst
zinit snippet OMZT::gnzh
# Theme
zinit light simnalamburt/shellder

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryuseifujiwara/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ryuseifujiwara/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ryuseifujiwara/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ryuseifujiwara/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
source <(kubectl completion zsh)
complete -o nospace -C /opt/homebrew/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

