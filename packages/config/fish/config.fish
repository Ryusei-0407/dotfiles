fish_add_path $HOME/.local/bin
fish_add_path $HOME/.nix-profile/bin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/openssl@1.1/bin

fish_config theme choose token

set -gx EDITOR nvim
set -gx VISUAL nvim

alias yabaiconf "vi $HOME/.config/yabai/yabairc"
alias skhdconf "vi $HOME/.config/skhd/skhdrc"
alias ja "plamo-translate --to Japanese"
alias en "plamo-translate --to English"
alias v nvim
alias vi nvim
alias vim nvim
alias j z
alias a "cd .."
alias ls "eza --git --icons"
alias la "eza --git --icons -a"
alias ll "eza -l --git --icons --no-user"
alias tree "eza --git --icons --git-ignore --tree"
alias cp "cp -p"
alias mkdir "mkdir -p"

abbr -a md treemd
abbr -a jl jless
abbr -a cut choose
abbr -a lg lazygit
abbr -a hex hexyl
abbr -a ps btop
abbr -a nsl nslookup
abbr -a pbc pbcopy
abbr -a pbp pbpaste
abbr -a watch viddy
abbr -a m make
abbr -a dps "docker ps"
abbr -a dimg "docker images"
abbr -a dup "docker compose up -d"
abbr -a ddown "docker compose down"
abbr -a dprune "yes | docker volume prune && yes | docker sytem prune --all"
abbr -a glog "git log --oneline --graph"
abbr -a site2skill "uvx --from git+https://github.com/laiso/site2skill site2skill"

fish_default_key_bindings

zoxide init fish | source

eval (/opt/homebrew/bin/brew shellenv)
eval (direnv hook fish)

set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
