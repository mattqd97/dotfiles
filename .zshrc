# If you come from bash you might have to change your $PATH.
# steps export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Better print for time
# export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# For fzf
export FZF_BASE="$HOME/.config/fzf"

# For cscope
export CSCOPE_DB=$HOME/firmware/cscope.out

# Not using oh-my-zsh theme
ZSH_THEME=""

fpath=(/usr/local/share/zsh-completions $fpath)

# For firmware functions
# FW_SHELL="$HOME/work/firmware/shell_functions.sh"
# source "$FW_SHELL"

# For tmux
LANG="en_US.UTF-8"

# For pure_tools
export PURE_TOOLS_DIR="$HOME/work/pure_tools"
export PATH=$PURE_TOOLS_DIR:$PATH

# For local bin
export PATH="$HOME/.local/bin:$PATH"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	fzf
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)
	# vi-mode

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

####################
# Pure theme stuff #
# ################ #

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure


# User configuration
bindkey '^ ' autosuggest-accept

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

#FZF path
fzf-binary-widget() {
  selected=( $( whence -pm '*' | \
    xargs -IX basename X | \
    FZF_DEFAULT_OPTS="--height \
    ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS \
    -n2..,.. --tiebreak=index \
    --bind=ctrl-r:toggle-sort \
    $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} \
      +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    LBUFFER="${RBUFFER}$selected "
  fi
  zle redisplay
  return "$ret"
}
zle     -N   fzf-binary-widget
# bind to Control-h, change this if you want a different key
bindkey '^H' fzf-binary-widget

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias rmswp='find . -name "*.sw[a-z]" | xargs rm'
alias fbf="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
alias sz='source ~/.zshrc'
alias pure_astyle='astyle --style=kr -s4 --align-pointer=middle -m0 -p --align-reference=middle --indent-switches --add-brackets --max-instatement-indent=100 --max-code-length=120'
alias ssh_agent='eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa'
alias gg='git grep'
alias gh='git lg | head'
alias gf='utils/git/pre-commit fix'
alias gr='cd `git rev-parse --show-toplevel`'
alias dmake='/opt/firmware_tools/bin/dmake'
alias drun='/opt/firmware_tools/bin/drun'

# Some useful functions
twls () {
	if ssh $1 '[ -d "/root/madavis/testlauncher" ]'; then
		echo "Testlauncher exists"
		ssh $1 /root/madavis/testlauncher/wssd-tools/bin/wssdtool ls
	else
		ssh $1 wssdtool ls
	fi
}

vic () {
	CONFIG="config.mk"
	if [ -f $CONFIG ]; then
		vim $CONFIG
	else
		echo "Could not find $CONFIG"
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
