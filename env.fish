fish_add_path -agP (printf "$HOME/.local/bin")
fish_add_path -agP (printf "$HOME/.cargo/bin")
fish_add_path -pgP (printf "/opt/homebrew/bin")
fish_add_path -agP (printf "$HOME/go/bin")
fish_add_path -agP (printf "$HOME/fzf/bin")
fish_add_path -agP "/home/linuxbrew/.linuxbrew/bin"

set -l git_atoms "refname" "objecttype" "objectsize" "objectname" "deltabase" "tree" "parent" "numparent" "object" "type" "tag" "author" "authorname" "authoremail" "authordate" "committer" "committername" "committeremail" "committerdate" "tagger" "taggername" "taggeremail" "taggerdate" "creator" "creatordate" "describe" "subject" "body" "trailers" "contents" "signature" "raw" "upstream" "push" "symref" "flag" "HEAD" "color" "worktreepath" "align" "end" "if" "then" "else" "rest" "ahead-behind"

alias ll="eza"
alias setclip="xclip -select c"
alias getclip="xclip -select c -o"
alias gap="git add -p"
alias gau="git add -u"
alias gaa="git add ."
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gb="git branch --show-current"
alias gpo="git push origin"
alias gpu="git pull origin"
alias gck="git checkout"
alias gs="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpob="git push origin (git branch --show-current)"
alias gpub="git pull origin (git branch --show-current)"
alias gbh="git rev-parse --abbrev-ref HEAD"
alias gf="arrout 3 $git_atoms"
alias dx="databricks"
alias cat="bat --paging=never --decorations=never"
alias gwt="git worktree"
alias gwtl="git worktree list"
alias gwta="git worktree add"
alias gwtr="git worktree remove"
alias gh="git rev-parse --abbrev-ref origin/HEAD"
alias gmb="gh | sd '\w+/' ''"
alias gd="git diff"
alias gdo="git diff origin/(git branch --show-current)"
alias gdm="git diff (gmb)"
alias gdom="git diff origin/HEAD"

alias cls="clear; fish"

set -gx CONFIG_DIRECTORY $HOME/.config
set -gx NVIM_DIRECTORY $CONFIG_DIRECTORY/nvim
set -gx NVIM_PYENV_ACTIVATE (fd "activate.fish" $NVIM_DIRECTORY -t f | head -n 1)
set -gx STARSHIP_DIRECTORY (fd "starship-prompts" $CONFIG_DIRECTORY -t d | head -n 1)
set -gx STARSHIP_SWITCHER (fd "starship_switch" $CONFIG_DIRECTORY -t f | head -n 1)
alias p="$STARSHIP_SWITCHER"
alias nvm="$NVIM_PYENV_ACTIVATE; nvim"
