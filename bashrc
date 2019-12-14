if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

CURRENT_BRANCH=$(git branch &> /dev/null;
                 if [[ $? -eq 0 ]]; then
                     echo " ($(git branch | grep "* " | cut -c3-))";
                 else
                     echo "";
                 fi)

function git_stash_apply() {
    git stash apply $(git stash list | grep $1 | head -n1 | sed 's/\(stash@{\)\([0-9]\{1,\}\)\(.*\)/\2/');
}

function prompt_command {
    CURRENT_BRANCH=$(git branch &> /dev/null;
                     if [[ $? -eq 0 ]]; then
                         echo " ($(basename $(git rev-parse --show-toplevel))@$(git branch | grep "* " | cut -c3-))";
                     else
                         echo "";
                     fi)
}

PROMPT_COMMAND=prompt_command

function UpdateCommandPrompt {
    COLOR_GREEN="\[\033[01;32m\]"
    COLOR_BLUE="\[\033[01;34m\]"
    COLOR_RESET="\[\033[00m\]"
    COLOR_GRAY="\[\033[38;05;8m\]"
    COLOR_CYAN="\[\033[01;36m\]"

    export PS1="\
$COLOR_GRAY[\T]\
$COLOR_BLUE \u\
$COLOR_RESET:\
$COLOR_GREEN\w\
$COLOR_CYAN\${CURRENT_BRANCH}\
$COLOR_RESET$\n"
}

UpdateCommandPrompt;export PATH=$HOME/local/bin:$PATH