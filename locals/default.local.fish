set -gx DEFAULT_PY_VENV $HOME/.config/pyenvs/default
alias pyv="source $DEFAULT_PY_VENV/bin/activate.fish"
alias py="$DEFAULT_PY_VENV/bin/python3"
alias ipy="$DEFAULT_PY_VENV/bin/ipython3"

set BROWSER "/usr/bin/google-chrome-stable"
set EDITOR "/usr/bin/nvim"
set SHELL "/usr/bin/fish"
