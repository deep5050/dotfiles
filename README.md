
<p align=center>
  <img src=dotfiles.png height=300px width=500px align=center>
</p>

# dotfiles

My custom configuration files for Linux.

Each branch has different styles for bash/fish/zsh configs

# How to apply?

Install `gnu stow` first.

1. `cd dotfiles`

2. `stow <pacakage-name>`


To override a package, defer the previous one with `stow -D <old-package-name>`
and apply new one with `stow <new-pacakage-name>`

This allows multiple configurations to exists under one place.

Default packages are listed uder `default-packages`

To get all the config you can simply run `make`



# Required tools

To use these confs. (see the install.sh file)

1. bat
2. fzf
3. ripgrep
4. zoxide
5. lsd
6. glow
8. fuck
9. tldr

# Other useful tools
11. [portal](https://github.com/SpatiumPortae/portal)
12. [share-cli](https://github.com/marionebl/share-cli)

![image](banner.png)

