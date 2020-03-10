# dotfiles for Matthew Davis
Configuration files, with setup using YADM

Picture of setup:
![Setup Picture](https://github.com/mattqd97/dotfiles/blob/master/.config/setup_pic.png)

**Requirements:**  
- Linux(Debian/Ubuntu) or OS X with brew  
- yadm  
- vim (with Python3 if you want YouCompleteMe, see [here](https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source))  
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
4. If on linux, put boostrap in ~/.yadm
5. Run bootstrap
```
yadm bootstrap
```

### Vim setup (altered slightly from [here](https://github.com/mattqd97/.vim))
1. Should be mostly automated. 
  **Note**: If you do not want to install YouCompleteMe, comment out `Plug 'Valloric/YouCompleteMe'` (~line 119)  
2. Finish installing [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) for line-completion  
  3.0 It boils down to installing the right tools, and then  
    `cd ~/.vim/plugged/YouCompleteMe`  
    `python3 install.py --clangd-completer`  
  3.1 [macOS Installation](https://github.com/ycm-core/YouCompleteMe#macos)  
  3.2 [Linux Installation](https://github.com/ycm-core/YouCompleteMe#linux-64-bit)  
  
### Tmux setup
1. Nothing!

### Zsh setup
1. Set zsh as default shell
```
chsh -s $(which zsh)
```

### Coming soon
Stuff for theme/font

That's it!
