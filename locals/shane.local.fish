alias py="python3"
alias ipy="python3 -m ipython"
alias nvm="nvim -u /home/shane/.config/nvim/minit.vim"
alias snvm="sudo nvim -u /home/shane/.config/nvim/minit.vim"
alias boxes="flatpak run org.gnome.Boxes"
alias spotify="flatpak run com.spotify.Client"

$HOME/.config/extra-configs/starship_switch 0
alias p="$HOME/.config/extra-configs/starship_switch"

set -gx BROWSER "/usr/bin/zen-browser"
set -gx EDITOR "/usr/bin/nvim"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
