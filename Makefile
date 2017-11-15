.PHONY = install

install: ~/.vim/autoload/plug.vim
	cp .*rc ~
	cp .Rprofile ~
	mkdir -p ~/.config/Code/User
	cp vscode/*.json ~/.config/Code/User
	vim +PlugInstall +qall!

# install the rice r console
# https://github.com/randy3k/rice
rice:
	pip3 install --user rice

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

