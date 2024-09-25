if status is-interactive
    if not string match -q "" (which startship)
        starship init fish | source
    end
end

fish_vi_key_bindings

source ~/.config/fish/functions.fish
source ~/.config/fish/env.fish

if not string match -q "" (which fzf)
    fzf --fish | source
end
