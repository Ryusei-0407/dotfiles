export HOMEBREW_CACHE=/opt/homebrew/cache
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/opt/homebrew/opt/openssl@1.1/bin:$PATH
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH

# alias
alias zshconf='vi ~/.zshrc'
alias t='tmux'
# alias y='yabai'
alias vi='nvim'
alias vim='nvim'
alias nv='neovide'
alias ls='exa --icons'
alias ll='exa -l --icons'
alias lla='exa -la --icons'
alias la='exa -a --icons'
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
alias gcc='/opt/homebrew/Cellar/gcc/11.2.0/bin/gcc-11'
alias g++='/opt/homebrew/Cellar/gcc/11.2.0/bin/g++-11 -std=c11'
alias py2='python'
alias py3='python3'
alias pip='pip3'
alias tf='terraform'
alias opensim='open -a Simulator'
alias dotfiles='~/dotfiles/install.sh'

eval "$(ssh-agent)"
eval "$(jump shell)"
figlet -f slant `date "+%H:%M:%S"`

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
complete -o nospace -C /opt/homebrew/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
