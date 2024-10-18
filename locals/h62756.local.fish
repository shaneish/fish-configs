set -gx PATH "$PATH:/Users/h62756/Library/Application Support/Coursier/bin"
alias npy="pyv; nvim"

source "$FISH_CONFIG_DIR/locals/cigna_certs.fish"

set EDITOR "/opt/homebrew/bin/nvim"
set SHELL "/opt/homebrew/bin/fish"

function dbsx --description "Search the Databricks Python SDK codebase for a string"
    psx $argv[1] (hp f dbrx-sdk)
end

function dbfx --description "Search the Databricks Python SDK codebase for a string"
    psx $argv[1] (hp f dbrx-sdk)
end
