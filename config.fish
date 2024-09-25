if status is-interactive
    if not string match -q "" (which startship)
        starship init fish | source
    end
    fish_config theme choose Batman
end

fish_vi_key_bindings

source ~/.config/fish/functions.fish
source ~/.config/fish/env.fish

if not string match -q "" (which fzf)
    fzf --fish | source
end
