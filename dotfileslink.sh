#!/bin/sh
mkdir -p ~/.claude
cp claude-settings.json ~/.claude/settings.json
cp CLAUDE.md ~/.claude/

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# append git prompt settings to bashrc
GIT_VERSION=$(git --version | cut -d' ' -f3)
if [ ! -f git-prompt.sh ]; then
    wget https://raw.githubusercontent.com/git/git/v$GIT_VERSION/contrib/completion/git-prompt.sh
fi
if [ ! -f git-completion.bash ]; then
    wget https://raw.githubusercontent.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash
fi

cat << 'EOF' >> ~/.bashrc
# git
if [ -f ~/.local/git-completion.bash ]; then
    source ~/.local/git-completion.bash
fi
if [ -f ~/.local/git-prompt.sh ]; then
    source ~/.local/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
EOF

cat << 'EOF' >> ~/.bashrc
alias vim='nvim'
EOF

