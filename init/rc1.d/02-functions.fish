define_command tech "fishdots plugin for working on file hierarchies divided by technologies"
define_subcommand_nonevented tech path tech_path "get the root path for the technology"
define_subcommand_nonevented tech cd tech_cd "goto the root path for the technology"


function tech_path -a key
    eval "echo \$fd_tech_paths_"$key
end

function tech_cd -a key
    cd (tech_path $key)
end