define_command tech "fishdots plugin for working on file hierarchies divided by technologies"
define_subcommand_nonevented tech ls tech_ls "list available technology areas"
define_subcommand_nonevented tech path tech_path "get the root path for the technology"
define_subcommand_nonevented tech cd tech_cd "goto the root path for the technology"
define_subcommand_nonevented tech open tech_open "select a technology and go there"


function tech_path -a key
    eval "echo \$fd_tech_paths_"$key
end

function tech_ls -a key
    set -l tech_roots (find $TECH_HOME -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 basename -a | string replace -a " " "_"  | string replace -a "-" "_" )

    for tr in $tech_roots
        echo $tr
    end
end

function tech_cd -a key
    cd (tech_path $key)
end


function tech_open -d "select a technology and go there"
    set -l matches (find $TECH_HOME -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 basename -a | string replace -a " " "_"  | string replace -a "-" "_" )
    if test 1 -eq (count $matches)
        if test -d $matches
            tech_cd $matches[1]
            return
        end
    end
    set -g dcmd "dialog --stdout --no-tags --menu 'select the project' 20 60 20 "
    set c 1
    for option in $matches
        set label $option
        set -g dcmd "$dcmd $option '$c $label'"
        set c (math $c + 1)
    end
    set choice (eval "$dcmd")
    clear
    if test $status -eq 0
        tech_cd $choice
    end
end