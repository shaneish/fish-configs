set -gx PY_VENV_BIN "/Users/h62756/.config/pyenvs/v3.12/bin"
alias py="$PY_VENV_BIN/python3"
alias ipy="$PY_VENV_BIN/ipython"

source "$FISH_CONFIG_DIR/locals/cigna_certs.fish"

set EDITOR "/opt/homebrew/bin/nvim"
set SHELL "/opt/homebrew/bin/fish"

function dbsrc --description "Search the Databricks Python SDK codebase for a string"
    set -l dir (hp f dbrx-sdk)
    hp dbrx-sdk
    if test -e $dir
        pysrc $argv
    end
end
