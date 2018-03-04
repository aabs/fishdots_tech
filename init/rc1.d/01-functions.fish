function tech_path
    set -l key $argv[1]
    echo (assoc.get tech_paths[$key])
end

function tech
    cd (tech_path $argv[1])
end