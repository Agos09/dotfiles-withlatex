"Disable settings
let g:polyglot_disabled = ['latex', 'javascript'] "allow vimtex to work + vim-js

"plugins!
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' "Allows me to change { to [ and what not
Plug 'tpope/vim-commentary' "Comment stuff
Plug 'tpope/vim-fugitive' "Git control for vim
Plug 'sheerun/vim-polyglot' "vim syntax for different languages
Plug 'vim-airline/vim-airline' "airline see bottom of bar
Plug 'vim-airline/vim-airline-themes' "airline theme theme
Plug 'honza/vim-snippets' " Snippets are separated from the engine
Plug 'morhetz/gruvbox' "Theme
Plug 'AlessandroYorba/Alduin' "airline
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' "auto completes [] and ()
Plug 'wellle/targets.vim' "adds more targets like [ or ,
Plug 'Yggdroot/indentLine' "indent lines like atom. See python file for ex
Plug 'lervag/vimtex' "To use latex better
Plug 'vimwiki/vimwiki' "To take notes better - testing this with vimtex
Plug 'scrooloose/nerdtree' "See dirs and files
Plug 'Xuyuanp/nerdtree-git-plugin' "git and nerd tree
Plug 'ryanoasis/vim-devicons' "Icons for plugins
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "color for icons
Plug 'junegunn/goyo.vim' "Distraction free
Plug 'junegunn/limelight.vim' "color free
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'bogado/file-line'
Plug 'ludovicchabant/vim-gutentags' "Tags Generate
Plug 'ron89/thesaurus_query.vim' "thesaurus
Plug 'turbio/bracey.vim' "live reloading
Plug 'yuezk/vim-js' "javascript
call plug#end()

"Global settings
filetype plugin indent on "required
syntax on "activates syntax highlighting among other things
set hidden "work with multiple unsaved buffers.
set backspace=indent,eol,start "Fixes the backspace
set incsearch "highlights as you search
set inccommand=split "for incsearch while sub
set rnu nu "sets line numbers
set foldmethod=indent "fold your code.
set foldlevel=99
set encoding=utf-8 "required by YCM
set noshowmode "make the current mode label disappear - I have airline for this.
set conceallevel=1 "Allows me to conceal latex syntax if not on line
set background=dark "Color scheme settings
set termguicolors "True colors term support
set splitbelow splitright "split correction
set wildmode=list:longest,list:full
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
so ~/.config/nvim/cocRC.vim "cocRC rec settings

"Key remapping
let mapleader = ","
nmap <leader>s :source ~/.config/nvim/init.vim<cr>
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>e <C-w><C-w>
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>
nmap <leader>z [s1z=
nmap <leader>p "+gp
nmap <leader>P "+gP
nmap <Leader>cc :ThesaurusQueryReplaceCurrentWord<CR>
nmap <Leader>ll <Plug>VimwikiFollowLink
nmap <Leader>ln <Plug>VimwikiNextLink
nmap <Leader>lp <Plug>VimwikiPrevLink
nmap <cr> o<Esc>
nmap Y y
imap jk <Esc>
imap <down> <Nop>
imap <right> <Nop>
imap <left> <Nop>
imap <up> <Nop>
vmap <leader>y "*y :let @+=@*<cr>
map <leader>1 :bp<cr>
map <leader>2 :bn<cr>
map <leader>3 :retab<cr>:FixWhitespace<cr>
map <leader>4 :Format<cr>
map <leader>5 :setlocal spell spelllang=en_us<cr>
map <leader>0 :silent !firefox %<cr>

"Extra
let g:tq_openoffice_en_file="~/.vim/thesaurus/Thes/th_en_US_new" "thesaurus
let g:airline_powerline_fonts='1' "powerline fonts
let g:powerline_pycmd="py3" "use py3
let g:airline#extensions#tabline#enabled='1' "Allows the top section of airline
let g:airline_theme='alduin' "alduin powerline theme
let g:gruvbox_italic='1' "enable italics
let g:gruvbox_contrast_dark='hard' "dark mode
let g:gruvbox_invert_selection='0' "No highlight
let g:AutoPairsFlyMode='1' "Auto pairs correction
let g:NERDTreeShowHidden='1' "hidden files
let g:python_highlight_all='1' "enable all syntax highlight
let g:NERDTreeHighlightCursorline = '0'
let g:indentLine_setColors = '0' "allows indent line to change colors
let g:fzf_preview_use_dev_icons = '1' "use dev-icons
colorscheme gruvbox "colorscheme

"vimtex config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode='0'
let g:indentLine_setConceal='0'
let g:tex_conceal='abdmg'

"Commands
command! FixWhitespace :%s/\s\+$//e
au! User GoyoEnter Limelight "limelight activates when in Goyo mode
au! User GoyoLeave Limelight! "deactivates

"skeletons!
autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex

"Java Support!
augroup javaSettings
	autocmd!
	au Filetype java set makeprg=javac\ %
	au FileType java noremap <buffer> <leader>8 <Esc>:w<cr>:make<cr>:copen<cr>
	au FileType java noremap <buffer> <leader>6 :cprevious<cr>
	au FileType java noremap <buffer> <leader>7 :cnext<cr>
	au FileType java noremap <buffer> <leader>9 :!clear;echo;echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end

"python Support!
augroup pythonSettings
	autocmd!
	au FileType python noremap <buffer> <leader>9 <Esc>:w<cr>:!clear;python %<cr>
	au BufNewFile,BufRead *.py set tabstop=4
	au BufNewFile,BufRead *.py set softtabstop=4
	au BufNewFile,BufRead *.py set shiftwidth=4
	au BufNewFile,BufRead *.py set textwidth=79
	au BufNewFile,BufRead *.py set expandtab
	au BufNewFile,BufRead *.py set autoindent
	au BufNewFile,BufRead *.py set fileformat=unix
	au BufWritePre *.py :FixWhitespace
augroup end


"Full stack development
augroup fullStack
	autocmd!
	au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2
	au BufNewFile,BufRead *.js,*.html,*.css set softtabstop=2
	au BufNewFile,BufRead *.js,*.html,*.css set shiftwidth=2
	au BufNewFile,BufRead *.js,*.html,*.css set expandtab
	au BufNewFile,BufRead *.js,*.html,*.css set autoindent
augroup end


"Muttrc
augroup mutt
	autocmd!
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set spell spelllang=en_us
	autocmd BufRead,BufNewFile /tmp/neomutt* noremap <leader>x :Goyo\|x!<cr>
augroup end

" Detect FileType
augroup autoDetect
	" Gmail
	au! BufNewFile,BufRead *.gmail             setfiletype muttrc
	"i3conf
	au! BufNewFile,BufRead ~/.config/i3/config setfiletype i3config
augroup end