# Dotfiles
Installation is handled by a makefile.
To list targets use `$ make help`. Default target is enable.
Two types of packages are available, stow and copy.
`$ make available` finds new and updated packages.
`$ make list` list all packages, their type and status.
`$ make enable` enables packages in ADD and disables those in REM.
`$ make disable` disable ADD and enable REM.
`$ make install` installs enabled packages and uninstalls disabled ones.
An enabled packages can be uninstalled by adding it to REM.
## I'm sorry
I have no idea why I thought this makefile was a good idea.
I regret writing it but now it's too late and my system depends on it.
When I gather enough motivation and courage I will rewrite this in something sensible.
