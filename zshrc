# History settings
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh_history
setopt hist_ignore_dups
# History settings end

# Prompt
setopt PROMPT_SUBST

git_prompt_info() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo " %F{green} $branch%f"
}
PS1='%F{blue} %2~%f$(git_prompt_info) %(?.%F{green}.%F{red}✘)%f '
# Prompt end



# Enable completion system
autoload -Uz compinit && compinit
# Enable completion system end

# Aliases
alias ls='ls --color=auto'
alias update="sudo apt update && sudo apt upgrade"
alias clean="sudo apt autoremove && sudo apt clean"
# Aliases end

# user-local bin to PATH
export PATH="$HOME/.local/bin:$PATH"
# user-local bin to PATH end


# bun bin to PATH
export PATH="$HOME/.bun/bin:$PATH"
# bun bin to PATH end


# fnm
FNM_PATH="/home/pranoy/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
# fnm end


# pnpm
export PNPM_HOME="/home/pranoy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/pranoy/.bun/_bun" ] && source "/home/pranoy/.bun/_bun"
# bun completions end

# fastfetch
if [[ -n $PS1 ]]; then
  fastfetch
fi
# fastfetch end
