.PHONY = install, desktop

install: ~/.vim/autoload/plug.vim
	cp .*rc ~
	cp .bash_profile ~
	cp .gitignore ~
	cp .Rprofile ~
	cp .ansible.cfg ~
	vim +PlugInstall +qall!
	git config --global color.ui auto
	git config --global push.default simple
	git config --global core.excludesfile '~/.gitignore'


# some desktop-focused configs
desktop:
	mkdir -p ~/.config/tilix/schemes
	cp tilix/* ~/.config/tilix/schemes
	
	mkdir -p ~/.atom
	cp atom/*.cson ~/.atom


# install Vim-Plug
~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

