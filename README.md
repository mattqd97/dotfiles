# dotfiles for Matthew Davis
Configuration files, with setup using YADM

Picture of setup:
![Setup Picture](https://github.com/mattqd97/dotfiles/blob/master/.config/setup_pic.png)

**Requirements:**  
- Linux or OS X with brew  
- git  
- vim (with Python3 if you want YouCompleteMe)  
- tmux  
- zsh  

## Installation
1. Install [yadm](https://yadm.io/docs/install)
2. cd to home directory
```
cd
```
3. Clone repo
```
yadm clone https://github.com/mattqd97/dotfiles.git
```

Hopefully some of the stuff below gets automated using the bootstrap functionality

### Vim setup (altered slightly from [here](https://github.com/mattqd97/.vim))
1. Open the vimrc in the repo
```
vim ~/.vim/vimrc
```
2. Run `:PlugInstall` in Vim  
  **Note**: If you do not want to install YouCompleteMe, comment out `Plug 'Valloric/YouCompleteMe'` (line 119)  
3. Finish installing [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) for line-completion  
  3.0 It boils down to installing the right tools, and then  
    `cd ~/.vim/plugged/YouCompleteMe`  
    `python3 install.py --clangd-completer`  
  3.1 [macOS Installation](https://github.com/ycm-core/YouCompleteMe#macos)  
  3.2 [Linux Installation](https://github.com/ycm-core/YouCompleteMe#linux-64-bit)  
  
### Tmux setup
If you do not have tmux-mem/tmux-cpu, install them  
```
sudo npm install -g tmux-mem tmux-cpu
```

Reload source for tmux
```
:source-file ~/.tmux.conf
```

Probably some other things too who knows tho

### Zsh setup
1. Install autocompletion/zsh-completions
2. Install pure theme
3. Install fzf
4. Source zsh
```
source ~/.zshrc
```

### Coming soon
Stuff for theme/font

That's it!
