set -gx FISH_CONFIG_DIR "$HOME/.config/fish"
for f in (string split " " $fish_user_paths)
    if test -e $f
        set -l parent_dir (string split "/" $f --right --m=1)
        set -l fish_config (string join "/" $parent_dir[1] "config.fish")
        if test -e $fish_config
            set -gx FISH_CONFIG_DIR $parent_dir[1]
            break
        end
    end
end

source "$FISH_CONFIG_DIR/locals/default.local.fish"
if test -e "$FISH_CONFIG_DIR/locals/$(id -un).local.fish"
    source "$FISH_CONFIG_DIR/locals/$(id -un).local.fish"
end
source "$FISH_CONFIG_DIR/env.fish"
source "$FISH_CONFIG_DIR/functions.fish"


if status is-interactive
    source "$FISH_CONFIG_DIR/greeting.fish"
    fish_vi_key_bindings
    if type -q "starship"
        starship init fish | source
    end
    fish_config theme choose Batdog
    if not string match -q "" (which python)
        pyv
    end
end

if not string match -q "" (which fzf)
    fzf --fish | source
end

