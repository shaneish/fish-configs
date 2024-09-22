function arrout
    set -l arr $argv[2..]
    set -l sub_len (math ceil (math (count $arr) / $argv[1]))
    for i in (seq $sub_len)
        set -l first (math 1 + (math (math $i - 1) \* $argv[1]))
        set -l last (math $i \* $argv[1])
        echo (string join " " $arr[$first..$last])
    end
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

