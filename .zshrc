# add this to the end of root .zshrc
# source ~/dotfiles/.zshrc



# node version manager setup
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PROMPT_EOL_MARK='' # to remove sign % in the end of the line when write to stdout


dbld (){
	cd $(git root)
	docker build -t ${PWD##*/} --file ./Dockerfile .
}

jstots (){
	for f in *.js; do
    		mv -- "$f" "${f%.js}.ts"
	done
}

gcog (){
	gco $(git branch --list | grep -i $1)
}

alias cht="curl cht.sh"

alias l="ls -lAh --color --group-directories-first"

# cat some-file | cb; and use it in X application
alias cb="xsel -ib"
# for nodejs projects usage
alias tree="tree -I node_modules -C"


git config --global alias.root 'rev-parse --show-toplevel'
git config --global user.name "ilya144"
git config --global user.email "44317561+ilya144@users.noreply.github.com"
