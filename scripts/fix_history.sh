cd ~
mv .zsh_history .zsh_history_bad
strings .zsh_history_bad > .zsh_history
vim -R .zsh_history
