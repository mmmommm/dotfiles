export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="/usr/local/opt/protobuf@3.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/s14958/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/s14958/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/s14958/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/s14958/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
