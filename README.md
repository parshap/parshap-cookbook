This is a chef cookbook to create and configure my personal user
account, `parshap`. It is tested in Ubuntu and SmartOS.

This cookbook does the following:

 * Creates the `parshap` user account and bootstraps it with
   `authorized_keys` and `known_hosts` files

 * Installs git, zsh, vim, tmux, nodejs

 * Installs my [personal dotfiles](https://github.com/parshap/dotfiles)

 * Installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

 * Installs [janus (vim distribution)](https://github.com/carlhuda/janus)

This cookbook is used by [devbox](https://github.com/parshap/devbox) to
provision my personal development environment but can also be used in
other configurations to simply create and configure a user account for
me. This cookbook expects my private key to be available during
provisioning.
