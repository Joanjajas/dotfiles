curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.config/cargo/bin/rust-analyzer
chmod +x ~/.config/cargo/bin/rust-analyzer
rm -rf ~.zshenv
rm -rf ~.profile
