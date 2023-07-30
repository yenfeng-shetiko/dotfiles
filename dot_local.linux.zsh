alias lsa='exa -alF --icons'
alias mv='advmv -g'
alias cp='advcp -g'

# pnpm
export PNPM_HOME="{{ .chezmoi.homeDir }}/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
