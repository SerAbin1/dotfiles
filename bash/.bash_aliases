alias cd="z"

alias la="ls -a"

alias gs="git status"

alias gl="git log"

alias gc="git add . && git commit"

alias gcp="git add . && git commit && git push"

alias pacman="sudo pacman"

alias flutter="fvm flutter"

cr() {
    git init && gh repo create "$1" --public --source=. --remote=origin
}

f() {
    local file
    file=$(find ~ -type f 2>/dev/null | fzf --height=40% --preview 'cat {} 2>/dev/null' --preview-window=right:60%)
    [ -n "$file" ] && nvim "$file"
}
fd() {
    local dir
    dir=$(find ~ -type d 2>/dev/null | fzf --height=40%)
    [ -n "$dir" ] && cd "$dir" && ls
}

mkcd() {
	mkdir "$1" && cd "$1"
}
