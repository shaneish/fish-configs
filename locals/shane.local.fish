set -gx DEFAULT_PY_VENV $HOME/.config/pyvenv/venv
alias py="python"
alias ipy="ipython"
alias mvim="nvim -u $HOME/.config/nvim/minit.vim"

alias snvm="sudo nvm"
alias boxes="flatpak run org.gnome.Boxes"
alias spotify="flatpak run com.spotify.Client"

set -gx BROWSER "/usr/bin/zen-browser"
set -gx EDITOR "/usr/bin/nvim"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

fish_add_path /home/shane/.modular/bin
