# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true" # Sorry
# Path to your oh-my-zsh installation.
plugins=(git docker colorize osx virtualenv zsh-autosuggestions)
ZSH_THEME="bullet-train"
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
alias gcaa="git commit -a --amend"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gcont="git add --all && git rebase --continue"
alias gd="git diff"
alias gdc="git diff --cached"
alias gg="git checkout master && git pull --rebase && git fetch"
alias gp="git pull"
alias gs="git status"
alias gwip="git add --all && git commit -m '[WIP]'"
alias la="ls -ltrAh"
alias q="exit"
alias psg="ps -ef | grep "
alias yt="yarn test -s --filter='!visual'"
alias ys="yarn install && yarn start"

BULLETTRAIN_PROMPT_ORDER=(
  time
  context
  dir
  git
)

BULLETTRAIN_CONTEXT_DEFAULT_USER='racheleversmann'
BULLETTRAIN_TIME_12HR=true;
BULLETTRAIN_TIME_BG=#ffa4ab;
BULLETTRAIN_TIME_FG=black;
BULLETTRAIN_TIME_12HR=true;
BULLETTRAIN_DIR_EXTENDED=1
function gpu () { git push -u origin `git rev-parse --abbrev-ref HEAD` }
function gif () {  gifify $@ at --resize 500:-1 --conpress 60 --colors 255 }
# Extra path lines

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
