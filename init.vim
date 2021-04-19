"Specify a directory for plugins"
call plug#begin('~/.config/nvim/plugged')

"Neovim theme"
Plug 'joshdick/onedark.vim'
"Lightline vim"
Plug 'itchyny/lightline.vim'
"Multiple language support"
Plug 'sheerun/vim-polyglot'
"Status Bar
Plug 'vim-airline/vim-airline'
"Vim-Airline Themes
Plug 'vim-airline/vim-airline-themes'
"Auto quote and braket completion
Plug 'jiangmiao/auto-pairs'
"Change comment style based on file type
Plug 'scrooloose/nerdcommenter'
"File managment and exploration
Plug 'scrooloose/nerdtree'
"Multiple cursors
Plug 'terryma/vim-multiple-cursors'
"Git icons
Plug 'airblade/vim-gitgutter'
"Auto-Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Initialize plugin system"
call plug#end()


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:airline_theme='onedark' " <theme> is a valid theme name

"Window-splitting and movment 
"It is using vim keys (for sure): j - down / k - up / ...
"Quick example:
"If you press ctrl + j and there is a pane below your pane, switch to it.
"Otherwhise create a new split pane below and switch to it.
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

"onedark theme"
syntax on
colorscheme onedark

:set number
:set cursorline
:set cursorcolumn

