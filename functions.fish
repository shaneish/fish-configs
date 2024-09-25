function arrout
    set -l arr $argv[2..]
    set -l sub_len (math ceil (math (count $arr) / $argv[1]))
    for i in (seq $sub_len)
        set -l first (math 1 + (math (math $i - 1) \* $argv[1]))
        set -l last (math $i \* $argv[1])
        echo (string join " " $arr[$first..$last])
    end
end

function emoji
    set word ""
    set word_2 ""
    if count $argv >= 1
        set word $argv[1]
    end
    if count $argv > 1
        set word_2 $argv[2]
    end
    if test -n "$word_2"
        set out (jq 'to_entries[] | .key, .value' ascii-emojis.json | rg $word_2 -A 1 | rg $word -A 1 -o | rg '^"(.*)"$' | sed 's/^[[:space:]]*"//g' | sed 's/"[[:space:]]*$//g' | shuf -n 1 | sed 's/\n//g')
    else if test -n "$word"
        set out (jq 'to_entries[] | .key, .value' ascii-emojis.json | rg $word -A 1 -o | rg '^"(.*)"$' | sed 's/^[[:space:]]*"//g' | sed 's/"[[:space:]]*$//g' | shuf -n 1 | sed 's/\n//g')
    else
        set out (jq 'to_entries[] | .value' ascii-emojis.json | shuf -n 1 | sed 's/^[[:space:]]*"//g' | sed 's/"[[:space:]]*$//g' | sed 's/\n//g')
    end
    echo $out
end

function hp
    set output (sh -c "bhop $argv")
    if not string match -q "*|*" $output
        echo $output
    else
        set cmds (string split "|" $output)
        cd $cmds[1]
        sh -c "$cmds[2]"
    end
end

