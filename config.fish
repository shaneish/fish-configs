set -gx FISH_CONFIG_DIR "$HOME/.config/fish"
for f in (string split " " $fish_user_paths)
    set ghost " .-." "(o o) boo!" "| O \\" " \\   \\" "  `~~~'"
    set cactus "" "        ,*-." "        |  |" "    ,.  |  |" "    | |_|  | ,." "    `---.  |_| |" "        |  .--`" "        |  |" "        |  | howdy partner! take arms!"
    set_color green
    set fish_greeting "$(printf %s\n $cactus)"
    set_color normal
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
source "$FISH_CONFIG_DIR/locals/default.local.fish"
if test -e "$FISH_CONFIG_DIR/locals/$(id -un).local.fish"
    source "$FISH_CONFIG_DIR/locals/$(id -un).local.fish"
end


if status is-interactive
    fish_vi_key_bindings
    if not string match -q "" (which starship)
        starship init fish | source
    end
    fish_config theme choose Batdog
end

if not string match -q "" (which fzf)
    fzf --fish | source
end
