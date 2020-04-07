
if not set -q TECH_HOME
    set -U TECH_HOME $PROJECT_HOME/by-technology
end
set -u tech_roots (find $TECH_HOME -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 basename -a)

for tr in $tech_roots
    eval ("set -x fd_tech_paths"$tr" "$TECH_HOME"/"$tr)    
end