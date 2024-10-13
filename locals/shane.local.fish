alias py="python3"
alias ipy="python3 -m ipython"
alias nvm="nvim -u /home/shane/.config/nvim/minit.vim"
alias snvm="sudo nvim -u /home/shane/.config/nvim/minit.vim"
alias boxes="flatpak run org.gnome.Boxes"
alias spotify="flatpak run com.spotify.Client"

set BROWSER "/usr/bin/zen-browser"
set EDITOR "/usr/bin/nvim"

fish_add_path /home/linuxbrew/.linuxbrew/bin

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
