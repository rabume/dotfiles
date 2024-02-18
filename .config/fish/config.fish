if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# enable vim mode
fish_vi_key_bindings

# add key bindings for clipboard
function fish_user_key_bindings
  bind y fish_clipboard_copy
  bind p fish_clipboard_paste
end

# Path for spicetify
fish_add_path /home/rafael/.spicetify

# export bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# g
set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# zoxide 
zoxide init fish | source

function ssh-vds
    set remote_user "CHANGEME"
    set remote_host "CHANGEME"
    set pw_id "CHANGEME"
    set password (bw get password "$pw_id")
    sshpass -p "$password" ssh $remote_user@$remote_host
end

# alias
alias ld lazydocker
alias lg lazygit
alias vi nvim
alias cd z
alias cdi zi
alias ls lsd
alias yt "ytfzf -t -T chafa"
alias sf "~/scripts/ripgrep-fzf-launcher.sh"
alias online "arp-scan --localnet"

# binds
bind \cf sf
