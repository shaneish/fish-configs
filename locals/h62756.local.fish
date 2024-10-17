set -gx PYTHON_VENV_DIR "/Users/h62756/.config/pyenvs"
set -gx PY_VENV "/Users/h62756/.config/pyenvs/v3.12"
set -gx DBRX_PY_VENV "/Users/h62756/.config/pyenvs/dbrx"
set -gx PATH "$PATH:/Users/h62756/Library/Application Support/Coursier/bin"
alias py="$PY_VENV_BIN/bin/python3"
alias npy=". $HOME/.config/nvim/.venv/bin/activate.fish; nvim"
alias ipy="$PY_VENV_BIN/bin/ipython"

source "$FISH_CONFIG_DIR/locals/cigna_certs.fish"

set EDITOR "/opt/homebrew/bin/nvim"
set SHELL "/opt/homebrew/bin/fish"

function dbsx --description "Search the Databricks Python SDK codebase for a string"
    psx $argv[1] (hp f dbrx-sdk)
end

function dbfx --description "Search the Databricks Python SDK codebase for a string"
    psx $argv[1] (hp f dbrx-sdk)
end
