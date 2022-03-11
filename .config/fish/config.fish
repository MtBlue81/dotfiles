set -U FZF_LEGACY_KEYBINDINGS 0
set PATH /Users/aoyama/bin /opt/local/bin /Users/aoyama/.rbenv/shims /Users/aoyama/.nodebrew/current/bin /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin $PATH
#fisherパッケージoh-my-fish/plugin-pecoの設定
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set GHQ_SELECTOR peco

# Run this command to configure your shell: 
# eval (docker-machine env dev)

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $PATH $fish_user_paths

# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"
status --is-interactive; and source (rbenv init -|psub);
status --is-interactive; and source (jump shell fish | psub)

