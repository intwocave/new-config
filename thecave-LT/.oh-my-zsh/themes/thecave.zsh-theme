# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%B%F{green}%n%f%b'
  PR_USER_OP='%B%F{green}%#%f%b'
  # PR_PROMPT='%B%f➤ %f%b'
  PR_PROMPT='%B%F{green}➤ %f%b'
else # root
  PR_USER='%B%F{red}%n%f%b'
  PR_USER_OP='%B%F{red}%#%f%b'
  PR_PROMPT='%B%F{red}➤ %f%b'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%B%F{red}%M%f%b' # SSH
else
  PR_HOST='%B%F{green}%m%f%b' # no SSH
fi


local return_code="%(?..%B%F{red}%? ↵%f%b)"

local user_host="${PR_USER}%B%F{cyan}@${PR_HOST}"
# local current_dir="%B%F{blue}%~%f%b"
local current_dir="%B%F{cyan}%~%f%b"
local git_branch='%B$(git_prompt_info)%b'

PROMPT="╭─${user_host} ${current_dir} \$(ruby_prompt_info) ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

# ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{yellow}【"
# ZSH_THEME_GIT_PROMPT_SUFFIX="› %f%b"
ZSH_THEME_GIT_PROMPT_SUFFIX="】 %f%b"
ZSH_THEME_RUBY_PROMPT_PREFIX="%B%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f%b"

}
