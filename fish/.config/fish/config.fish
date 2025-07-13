set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -g ~/.local/bin

set -Ux VISUAL nvim
set -Ux EDITOR nvim

set -Ux TERM xterm-256color

alias ls "ls --color=auto -l"
alias ll "ls -l"
alias la "ls -A"
alias l "ls -CF"

alias lg lazygit
alias nv nvim
# alias cd z

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/loves/miniforge3/bin/conda
    eval /Users/loves/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/loves/miniforge3/etc/fish/conf.d/conda.fish"
        . "/Users/loves/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/loves/miniforge3/bin" $PATH
    end
end

if test -f "/Users/loves/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/Users/loves/miniforge3/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<


# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims


set -x PATH "/Users/loves/.juliaup/bin" $PATH
set -Ux GOPATH "/Users/loves/go"
set -x PATH (go env GOPATH)/bin $PATH

set -Ux ANDROID_HOME "$HOME/Library/Android/sdk"
set -x PATH $ANDROID_HOME/emulator $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH
set -x PATH $HOME/development/flutter/bin $PATH
set -x PATH $PATH $HOME/.pub-cache/bin

zoxide init fish | source
starship init fish | source

# Setting PATH for Python 3.12
# The original version is saved in /Users/loves/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bin" "$PATH"

# Setting PATH for Python 3.8
# The original version is saved in /Users/loves/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.8/bin" "$PATH"


set -gx NVM_DIR "$([ -z "$XDG_CONFIG_HOME" ] && printf %s "$HOME/.nvm" || printf %s "$XDG_CONFIG_HOME/nvm")"

function nvm
    bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/lovess/.lmstudio/bin
# End of LM Studio CLI section

