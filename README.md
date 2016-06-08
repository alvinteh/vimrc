# vimrc

vimrc configuration for development.

## Usage

1. Copy the `.vimrc` file to `~/`.
2. Install Vundle by running:
  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
3. Install the vim plugins by running:
  `vim +PluginInstall +qall`
4. Install YouCompleteMe dependencies
  `sudo yum install automake cmake gcc gcc-c++ kernel-devel python-devel python3-devel`
5. Install any language-specific YouCompleteMe dependencies (e.g. `npm` for JS auto-completion)
6. Compile YouCompleteMe
   `cd ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --tern-completer`

## Dependencies

- vim 7.3.598+
- git (for installing Vundle)
- golang 1.4.2+ (optional; for Golang editing)

## License

Copyright 2016 Alvin Teh.
Licensed under the MIT license.
