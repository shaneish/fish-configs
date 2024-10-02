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

source "$FISH_CONFIG_DIR/env.fish"
source "$FISH_CONFIG_DIR/functions.fish"

set ghost " .-." "(o o) boo!" "| O \\" " \\   \\" "  `~~~'"
set cactus "    ,*-." "    |  |" ",.  |  |" "| |_|  | ,." "`---.  |_| |" "    |  .--`" "    |  |" "    |  | howdy partner!"
set fish_greeting "$(printf %s\n $cactus)"

set local_configs "$FISH_CONFIG_DIR/locals/default.local.fish"
if test -e "$FISH_CONFIG_DIR/locals/$(id -un).local.fish"
    set local_configs "$FISH_CONFIG_DIR/locals/$(id -un).local.fish"
end
source $local_configs


if status is-interactive
    fish_vi_key_bindings
    if not string match -q "" (which startship)
        starship init fish | source
    end
    fish_config theme choose Batman
end

if test -e "locals/$(id -un).local.fish"
    source "locals/$(id -un).local.fish"
else
    if test -e "locals/default.local.fish"
        source "locals/default.local.fish"
    end
end

if not string match -q "" (which fzf)
    fzf --fish | source
end
