function arrout
    set -l arr $argv[2..]
    set -l sub_len (math ceil (math (count $arr) / $argv[1]))
    for i in (seq $sub_len)
        set -l first (math 1 + (math (math $i - 1) \* $argv[1]))
        set -l last (math $i \* $argv[1])
        echo (string join " " $arr[$first..$last])
    end
end

function emoji --description "Get an emoji"
    set multi 0
    set lines 1
    set pattern "$argv[1].*$argv[2]|$argv[2].*$argv[1]"
    if test $argv[1] = "-m" || test $argv[1] = "--multi"
        set pattern "$argv[2].*$argv[3]|$argv[3].*$argv[2]"
        set multi 1
    end
    set out (jq -r 'to_entries[] | .key, .value' $HOME/.config/fish/ascii-emojis.json | rg "$pattern" -A 1 --context-separator="" -o -r "" | rg -N "\S")
    if test $shift = 1
        set lines (count $out)
    end
    printf %s\n $out | shuf -n $lines
end

function emojis --description "Select from emojis"
    emoji -m $argv | fzf
end

function hp --description "Hop around the terminal"
    set output (sh -c "bhop $argv")
    if not string match -q "*|*" $output
        echo $output
    else
        set cmds (string split "|" $output)
        cd $cmds[1]
        sh -c "$cmds[2]"
    end
end

function manp --description "A simple manpage result without the BS backspace characters"
    man $argv | col -b
end

function src --description "Search a codebase and open files in your editor"
    set -l options 'i/include' 'x/exclude' 'd/dont_include_i' 'e/editor'
    argparse $options -- $argv[2..]
    set cmd $argv[1]
    if not set -q _flag_dont_include_i
        set cmd "$cmd -i"
    end
    if set -q _flag_include
        set cmd = "$cmd -t $_flag_include"
    end
    if set -q _flag_exclude
        set cmd = "$cmd -T $_flag_exclude"
    end
    set editor "nvim"
    if set -q _flag_editor
        set editor $_flag_editor
    end
    set cmd = "rg $cmd -l | xargs $editor -c '/$($argv[1])'"
    fish -c $cmd
end

function pysrc --description "Search a Python codebase for a string"
    src $argv[1] T=rst t=py g='!__init__.py' g="!test_*"
end

