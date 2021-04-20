#
# Dotfiles
# www.github.com/jovanlanik
#

# Makefile

.DEFAULT_GOAL = enable
DEFAULT_STATE = disabled

.PHONY: available enable install list help

.dots/available .dots/enabled .dots/disabled .dots/installed .dots/uninstalled: | .dots
.dots .dots/available .dots/enabled .dots/disabled .dots/installed .dots/uninstalled:
	@mkdir '$@'

.dots/available/%:: stow/%  | .dots/available .dots/uninstalled .dots/$(DEFAULT_STATE)
	@[ -f '$@' ] || touch '.dots/uninstalled/$*'
	@[ -f '$@' ] || touch '.dots/$(DEFAULT_STATE)/$*'
	@touch '$@'
	@echo 'Found stow package: $*'
.dots/available/%:: copy/%  | .dots/available .dots/uninstalled .dots/$(DEFAULT_STATE)
	@[ -f '$@' ] || touch '.dots/uninstalled/$*'
	@[ -f '$@' ] || touch '.dots/$(DEFAULT_STATE)/$*'
	@touch '$@'
	@echo 'Found copy package: $*'

.dots/enabled/%: | .dots/available/% .dots/enabled
	@rm -f '.dots/disabled/$*'
	@touch '$@'
	@echo 'Enabled package: $*'

.dots/disabled/%: | .dots/available/% .dots/disabled
	@rm -f '.dots/enabled/$*'
	@touch '$@'
	@echo 'Disabled package: $*'

.dots/installed/%:: .dots/enabled/% stow/% | .dots/installed
	@echo 'Stowing package: $*'
	@util/stow.sh '$*'
	@rm -f '.dots/uninstalled/$*'
	@touch '$@'
.dots/installed/%:: .dots/enabled/% copy/% | .dots/installed
	@echo 'Copying package: $*'
	@util/copy.sh '$*'
	@rm -f '.dots/uninstalled/$*'
	@touch '$@'

.dots/uninstalled/%:: | stow/% .dots/uninstalled
	@echo 'Unstowing package: $*'
	@util/stow.sh -u '$*'
	@rm -f '.dots/installed/$*'
	@touch '$@'
.dots/uninstalled/%:: | copy/% .dots/uninstalled
	@echo 'Removing package: $*'
	@util/copy.sh -u '$*'
	@rm -f '.dots/installed/$*'
	@touch '$@'

%:: stow/%
	@touch $<
%:: copy/%
	@touch $<

dots = $(addprefix .dots/, $(addprefix $(1)/, $(2)))
enable = $(call dots, enabled, $(1))
disable = $(call dots, disabled, $(1))
install = $(call dots, installed, $(1))
uninstall = $(call dots, uninstalled, $(1))

ALL = $(notdir $(wildcard stow/*) $(wildcard copy/*))

I_ADD = $(filter-out $(REM), $(sort $(ADD) $(notdir $(wildcard .dots/enabled/*))))
I_REM = $(filter-out $(ADD), $(sort $(REM) $(notdir $(wildcard .dots/disabled/*))))

available: $(call dots, available, $(ALL)) ## Find new and updated packages
enable: available $(call enable, $(I_ADD)) $(call disable, $(I_REM)) ## Enable and disable packages
install: available $(call install, $(I_ADD)) $(call uninstall, $(I_REM)) ## Install and uninstall packages

disable: available $(call enable, $(REM)) $(call disable, $(ADD)) ## Disable and enable packages
uninstall: available $(call install, $(REM)) $(call uninstall, $(ADD)) ## Uninstall and install packages

list: | available ## List available packages and their state
	@util/list.sh

help: ## Show commented targets
	@grep -hE '^\S[^:]*:[^#]*##.+' $(MAKEFILE_LIST) \
		| sed 's/:[^#]*##\s*/#/' \
		| sort -t '#' -k 1 \
		| column -tN TARGET,COMMENT  -s '#'

