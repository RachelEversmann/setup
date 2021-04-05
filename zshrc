# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
plugins=(tmuxinator git docker colorize osx virtualenv zsh-autosuggestions)
DISABLE_AUTO_UPDATE="true" # Sorry
# Path to your oh-my-zsh installation.
ZSH_THEME="spaceship"
DEFAULT_USER=`whoami`
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# Aliases

alias be="bundle exec"
alias sp="bundle exec rspec -c"
alias ss="bundle exec rails server"

alias ga="git add --all"
alias gap="git add --patch"
alias gc="git checkout"
alias gca="git commit --amend --no-edit"
alias gcaa="git commit -a --amend"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gcc="git commit -m 'cleaned up code'"
alias gct="git commit -m 'fixed test'"
alias gcb="git commit -m 'fixed baselines'"
alias gcont="git add --all && git rebase --continue"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpull="git pull --rebase && git fetch --prune"
alias gg="git checkout master && git pull --rebase && git fetch --prune"
alias gp="git pull"
alias gs="git status"
alias gwip="git add --all && git commit -m '[WIP]'"
alias la="ls -ltrAh"
alias q="exit"
alias psg="ps -ef | grep "
alias yt="yarn install && yarn test -s --filter='!visual'"
alias ys="yarn install && yarn start"
alias client="cd ~/Sandbox/vui/client"
alias home="cd ~/Home/vui"
alias visual="cd ~/Home/vui/client/visual-test-output"
alias fix="sh ~/Home/fix.sh"
alias restart="sh ~/Home/restart.sh"
alias run-tests="sh ~/Home/run-tests.sh"
alias kill-yarn="kill $(lsof -t -i:4200)"
function gpu () { git push -u origin `git rev-parse --abbrev-ref HEAD` }
function gif () {  gifify $@ at --resize 500:-1 --conpress 60 --colors 255 }
# Extra path lines

SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  # user          # Username section
  dir           # Current directory section
  # host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet        # .NET section
  ember         # Ember.js section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_TIME_COLOR=white
SPACESHIP_USER_COLOR=green

export PATH=$HOME/bin:/usr/local/bin:$PATH

fpath=(/usr/local/share/zsh-completions $fpath)
# use fd for fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
setopt autocd
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'
alias readlink=greadlink
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function gbb(){
git branch --sort=-committerdate | grep $@ | head -n 1 | xargs git checkout
}
function gauth(){
git ls-tree -r -z --name-only HEAD -- $@ | xargs -0 -n1 git blame \
--line-porcelain HEAD |grep "^author "|sort|uniq -c|sort -nr
}
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval $(~/.linuxbrew/bin/brew shellenv)
eval `ssh-agent -s`
ssh-add ~/.ssh/vectra