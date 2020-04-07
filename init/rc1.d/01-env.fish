
if not set -q TECH_HOME
    set -U TECH_HOME $PROJECT_HOME/by-technology
end
set -l tech_roots (find $TECH_HOME -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 basename -a | string replace -a " " "_"  | string replace -a "-" "_" )

for tr in $tech_roots
    eval "set -e fd_tech_paths_$tr"
    eval "set -x fd_tech_paths_"$tr" '"$TECH_HOME"/"$tr"'"
end