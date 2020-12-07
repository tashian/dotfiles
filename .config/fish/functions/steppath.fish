function steppath
    echo "Old STEPPATH "(step path)    
    if test "$argv" = "staging"
        export STEPPATH=~/.step-staging/
		printf "\033]1337;SetUserVar=%s=%s\007" steppath (echo -n "staging" | base64)
    else if test "$argv" = "temp"
        export STEPPATH=(mktemp -d)
		printf "\033]1337;SetUserVar=%s=%s\007" steppath (echo -n "temp" | base64)
    else if test "$argv" = ""
        set -e STEPPATH
		printf "\033]1337;SetUserVar=%s=%s\007" steppath (echo -n (step path) | base64)
    end
    echo "New STEPPATH "(step path)
end

