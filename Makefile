.PHONY: install

install: $(HOME)/.zshrc $(HOME)/.ssh/config $(HOME)/.vimrc

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
