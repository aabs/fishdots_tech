set -x TECH_HOME $PROJECT_HOME/by-technology
set -x tech_roots (find $TECH_HOME -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 basename -a)

for tr in $tech_roots
    assoc.set tech_paths[$tr]   "$TECH_HOME/$tr"    
end