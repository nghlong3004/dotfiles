# ==========================================
# 1. HISTORY
# ==========================================
HISTFILE="$HOME/.zsh_history"
HISTSIZE=20000
SAVEHIST=20000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD

# ==========================================
# 2. KEYBINDINGS
# ==========================================
bindkey -e

# ==========================================
# 3. COMPLETION
# ==========================================
autoload -Uz compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}'

compinit

# ==========================================
# 4. ALIASES
# ==========================================
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lah --icons=auto --git --group-directories-first'
alias la='eza -a --icons=auto'
alias lt='eza --tree --level=2 --icons=auto'

alias bat='batcat'
alias fd='fdfind'

alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -15'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ==========================================
# 5. NODE.JS / NVM (IF INSTALLED)
# ==========================================
export NVM_DIR="$HOME/.nvm"

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  source "$NVM_DIR/nvm.sh"
fi

# ==========================================
# 6. JAVA / SDKMAN (IF INSTALLED)
# ==========================================
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# ==========================================
# 7. PYTHON / UV (IF INSTALLED)
# ==========================================
if [[ -s "$HOME/.local/bin/env" ]]; then
  source "$HOME/.local/bin/env"
fi

# ==========================================
# 8. AUTOSUGGESTIONS
# ==========================================
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ==========================================
# 9. STARSHIP PROMPT
# ==========================================
eval "$(starship init zsh)"

# ==========================================
# 10. SYNTAX HIGHLIGHTING
# Must load last
# ==========================================
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ "$PWD" == /mnt/c/Users/* ]] && cd ~
