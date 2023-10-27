export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.nix-profile/bin
export PATH=$PATH:$HOME/.config/emacs/bin
alias em='emacs -nw'
alias ls='eza --icons'
alias lsa='ls -alF'
export GPG_TTY=$(tty)
#bat https://github.com/sharkdp/bat
export BAT_STYLE=plain
export BAT_THEME="TwoDark"
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Wget
alias wgetncc='wget --no-check-certificate'
alias wgetc='wget `clippaste`'
function wget_archive_and_extract {
  URL=$1
  FILENAME=${URL##*/}
  wget $URL -O $FILENAME
  extract -r $FILENAME
}
alias wgetae='wget_archive_and_extract '
alias wgetaec='wgetae clippaste'

# Utils
alias sitecopy='wget -k -K -E -r -l 10 -p -N -F -nH '
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 '
# rga
rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}
