ZDOTDIR=/home/john/.dotfiles/zsh
ZPLUG=$ZDOTDIR/plugins
LOCALAPPS=/home/john/.local/share
mkdir -p $LOCALAPPS $ZDOTDIR $ZPLUG
ln -s $ZDOTDIR/.zshrc ~/.zshrc


####
# Install FZF
####
git clone --depth 1 https://github.com/junegunn/fzf.git $LOCALAPPS/fzf && $LOCALAPPS/fzf/install --no-update-rc --completion --key-bindings

####
# Install zsh autosuggestions
####
git clone https://github.com/zsh-users/zsh-autosuggestions $ZPLUG/zsh-autosuggestions

####
# Install zsh syntax highlighting
####
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZPLUG/zsh-syntax-highlighting

####
# Install k
####
git clone https://github.com/supercrabtree/k.git $ZPLUG/k

# Install Rust (for building fd-find from source)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. $HOME/.cargo.env

####
# Install fd-find
####
git clone https://github.com/sharkdp/fd $LOCALAPPS/fd
cargo build --manifest-path $LOCALAPPS/fd/Cargo.toml
cargo install --path $LOCALAPPS/fd

####
# Install enhancd
####
git clone https://github.com/b4b4r07/enhancd $ZPLUG/enhancd
mkdir $LOCALAPPS/enhancd && touch $LOCALAPPS/enhancd/enhancd.log

####
# Install NVM
####
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'