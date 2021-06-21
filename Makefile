.PHONY: install

install: $(HOME)/.zshrc $(HOME)/.ssh/config $(HOME)/.vim/colors/solarized.vim $(HOME)/.vimrc

$(HOME)/.%: .%
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
