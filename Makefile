.PHONY: install

install: $(HOME)/.gitignore $(HOME)/.zprofile $(HOME)/.zshrc $(HOME)/.ssh/config $(HOME)/.vim/colors/solarized.vim $(HOME)/.vimrc $(HOME)/Library/KeyBindings/DefaultKeyBinding.dict

$(HOME)/.%: .%
	-test -f $@ && mv $@ $@.bak
	-rm $@
	ln $< $@

$(HOME)/.gitignore: .gitignore-GLOBAL
	-test -f $@ && mv $@ $@.bak
	-rm $@
	ln $< $@

$(HOME)/.ssh:
	mkdir -p $@
	touch $@

$(HOME)/.ssh/config: .ssh/config $(HOME)/.ssh
	-test -f $@ && mv $@ $@.bak
	-rm $@
	ln $< $@

$(HOME)/.vim/colors/solarized.vim: .vim/colors/solarized.vim
	mkdir -p $(shell dirname $@)
	ln $< $@

$(HOME)/Library/KeyBindings/DefaultKeyBinding.dict: Library/KeyBindings/DefaultKeyBinding.dict
	mkdir -p $(shell dirname $@)
	-test -f $@ && mv $@ $@.bak
	-rm $@
	ln $< $@
