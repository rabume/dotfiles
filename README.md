# dotfiles
![image](https://github.com/rabume/dotfiles/assets/19410629/1181595d-7b21-4335-baf3-90140ea46d33)

This is a collection of my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Usage

```bash
git clone https://github.com/rabume/dotfiles.git && cd dotfiles
stow --adopt .
```

## Notice
- The etc folder is ignore by stow, so you will need to copy the files manually.
- Right now some of the files asume that the user is called `rafael` and that the home directory is `/home/rafael`. I will fix this in the future.
- Some scripts like the [flameshot.sh](./scripts/flameshot.sh) and [config.fish](./.config/fish/config.fish) need to be modified to work. (Credentials, host, etc.)
