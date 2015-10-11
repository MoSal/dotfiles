. /home/user64/.envs # absolute because we use this in root
. /home/user64/.aliases # absolute because we use this in root
. /home/user64/.functions # absolute because we use this in root
. /home/user64/.execs # absolute because we use this in root

# make '/' a word separator (a non word char), also ';', '=' and '&'
WORDCHARS='*?_-.[]~!#$%^(){}<>'
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'

# Add path for local completions
fpath=($fpath $XDG_DATA_HOME/zsh/site_functions)

## input mode ,also see bindkey (man zshall)
#set -o vi

# Custom zle widgets
zap-to-char-backwards() {
	zle zap-to-char -n -1
}
zle -N zap-to-char-backwards

delete-to-char-backwards() {
	zle delete-to-char -n -1
}
zle -N delete-to-char-backwards

# bindkey(s)
#bindkey "^H" delete-to-char-backwards
bindkey "^H" zap-to-char-backwards
bindkey "^D" delete-word
bindkey "^U" backward-kill-line # opposite of "^K"
# Overwritten Defaults
#bindkey "^H" backward-delete-char
#bindkey "^D" delete-char-or-list
#bindkey "^U" kill-whole-line

# DISABLE GRML  match uppercase from lowercase
#zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*'                 matcher-list 'm:{a-z}={a-z}'
zstyle ':completion:*'                 matcher-list 'm:{A-Z}={A-Z}'
