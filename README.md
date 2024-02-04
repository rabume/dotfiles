# dotfiles

This is a collection of my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Usage

```bash
git clone https://github.com/rabume/dotfiles.git && cd dotfiles
stow --adopt .
```

## Notice

Right now some of the files asume that the user is called `rafael` and that the home directory is `/home/rafael`. I will fix this in the future.

Some scripts like the [flameshot.sh](./scripts/flameshot.sh) and [config.fish](./.config/fish/config.fish) need to be modified to work. (Credentials, host, etc.)
