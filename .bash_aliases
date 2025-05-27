alias cd="z"

alias la="ls -a"

alias ga="git status"

alias gc="git add . && git commit"

g() {
    g++ "$1" -std=c++98 -Wall -Wextra -o "${1%.cpp}" && ./"${1%.cpp}"
}

cr() {
    gh repo create "$1" --public --source=. --remote=origin --push
}

gac() {
    git add . && git commit -m "$1" && git push -u origin main
}

react() {
    npm create vite@latest . -- --template react
}

tail() {
    npm install tailwindcss @tailwindcss/cli
}

acttail() {
    npx @tailwindcss/cli -i style.css -o output.css --watch
}
