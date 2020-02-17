###
# This are useful scripts to have in your .bashrc/.bash_profile file when developing on Gorgonia (or really, in Go)
###

# PS1 stuff
ANSIGREEN="\\033[0;32m"
ANSIYELLO="\\033[0;33m"
ANSIRESET="\\033[0m"

# matchgopath finds a GOPATH, and appends a $ANSIGREEN or $ANSIYELLOW colour into the results.
# this is useful for setting a $PS1 that colours the path based on whether a GOPATH or PATH is set.
#     Green  : GOPATH is set and PATH contains GOPATH
#     Yellow : GOPATH is set, but PATH does not contain GOPATH
function matchgopath {
        local gp="$(echo $GOPATH)"
	local p="$(echo $PATH)"
        if [[ $gp != '' && $PWD =~ $gp.+ && $p == *"$gp"* ]]; then
                echo -e "$ANSIGREEN"
        elif [[ $gp != '' && $PWD =~ $gp.+ ]]; then
		echo -e "$ANSIYELLOW"
	else
                echo -e "$ANSIRESET"
        fi
}
# This PS1 calls matchgopath, which prepends a colour.
export PS1="\\u@\\h:\\[\$(matchgopath)\\]\\w\\[$ANSIRESET\\] \$ "

# workspace_cd finds a .bashworkspace file in a repository and if found, calls it.
#
# gorgonia has .bashworkspace files in its repo, so one may just `wscd path/to/gorgonia/repo` and it will
# automatically set PATH and GOPATH.
function workspace_cd() {
    cd $@ && [ -f ".bashworkspace" ] && source .bashworkspace
}
alias wscd="workspace_cd"
