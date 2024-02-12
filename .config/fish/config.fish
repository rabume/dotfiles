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

# alias
alias ld lazydocker
alias lg lazygit
alias vi nvim

fish_add_path /home/rafael/.spicetify

function ssh-vds
    set remote_user "CHANGEME"
    set remote_host "CHANGEME"
    set pw_id "CHANGEME"
    set password (bw get password "$pw_id")
    sshpass -p "$password" ssh $remote_user@$remote_host
end

# export bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
