alias cd="z"

alias la="ls -a"

alias gs="git status"

alias gl="git log"

alias gc="git add . && git commit"

alias gcp="git add . && git commit && git push"

alias aider="aider --model openrouter/openrouter/free"

alias update="sudo apt update && sudo apt upgrade -y"

getgo() {
    wget http://media.pragprog.com/titles/tjgo/code/"$1"
}

g() {
    g++ "$1" -Wall -Wextra -o "${1%.cpp}" && ./"${1%.cpp}"
}

cr() {
    git init && gh repo create "$1" --public --source=. --remote=origin
}

react() {
    npm create vite@latest . -- --template react
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

vnv() {
	source "$1"/bin/activate
}

mkcd() {
	mkdir "$1" && cd "$1"
}
