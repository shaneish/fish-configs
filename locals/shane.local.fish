set -gx DEFAULT_PY_VENV $HOME/.config/pyvenv/venv
alias pyv="source $DEFAULT_PY_VENV/bin/activate.fish"
alias py="$DEFAULT_PY_VENV/bin/python3"
alias ipy="$DEFAULT_PY_VENV/bin/ipython3"
alias nvm="nvim -u $HOME/.config/nvim/minit.vim"
alias snvm="sudo nvm"
alias boxes="flatpak run org.gnome.Boxes"
alias spotify="flatpak run com.spotify.Client"

set -gx BROWSER "/usr/bin/zen-browser"
set -gx EDITOR "/usr/bin/nvim"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
