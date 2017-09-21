.PHONY = install

install:
	cp .*rc ~
	cp .Rprofile ~
	mkdir -p ~/.config/Code/User
	cp vscode/*.json ~/.config/Code/User

# install the rice r console
# https://github.com/randy3k/rice
rice:
	pip3 install --user rice

