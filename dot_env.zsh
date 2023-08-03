export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.nix-profile/bin
alias em='emacs -nw'
export GPG_TTY=$(tty)
#bat https://github.com/sharkdp/bat
export BAT_STYLE=plain
export BAT_THEME="TwoDark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
# Clipboard
{{ if eq .chezmoi.os "linux"}}alias getcb='wl-paste'{{ end }}
{{ if eq .chezmoi.os "windows"}}alias getcb='cat /dev/clipboard'{{ end }}
{{ if eq .chezmoi.os "android"}}alias getcb='termux-clipboard-get'{{ end }}

# Wget
alias wgetncc='wget --no-check-certificate'
alias wgetc='wget `getcb`'

function wget_archive_and_extract {
  URL=$1
  FILENAME=${URL##*/}
  wget $URL -O $FILENAME
  extract -r $FILENAME
}
alias wgetae='wget_archive_and_extract '
alias wgetaec='wgetae getcb'

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
