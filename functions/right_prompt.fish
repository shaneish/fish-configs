function fish_right_prompt
    if not string match -q -- "*right*" (basename (readlink -f $HOME/.config/starship.toml))
        if test $FISH_FIRST_SESSION -eq 1
            echo (set_color ffd700)(prompt_pwd)
            set -x FISH_FIRST_SESSION 0
        end
    end
end
