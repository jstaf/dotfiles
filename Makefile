.PHONY = install, rice

install: ~/.vim/autoload/plug.vim
	cp .*rc ~
	cp .Rprofile ~
	vim +PlugInstall +qall!
	mkdir -p ~/.config/tilix/schemes
	cp gruvbox.json ~/.config/tilix/schemes
	mkdir -p ~/.config/Code/User
	cp vscode/*.json ~/.config/Code/User



# install the rice r console
# https://github.com/randy3k/rice
rice:
	pip3 install --user rice


# fonts for airline on desktop clients
powerline_fonts:
	git clone https://github.com/powerline/fonts.git
	fonts/install.sh


# install Vim-Plug
~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

