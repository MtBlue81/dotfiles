" ------------------------------------------------------------------------------
" .vimrc
"
" Tanaka Yuuya <tnker0217@gmail.com>
" ------------------------------------------------------------------------------

set nomodeline
" encodeの設定
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" Vi互換をオフにする
set nocompatible " Be iMproved

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" ------------------------------------------------------------------------------
"  Recommended to install
"  After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" ------------------------------------------------------------------------------
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'liquidz/vimfiler-sendto'

" ------------------------------------------------------------------------------
"  シンタックス系プラグイン
" ------------------------------------------------------------------------------
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


" CoffeeScript Syntax/Auto Compile
NeoBundle 'kchmck/vim-coffee-script'
" TypeScript Syntax/Auto Complete
" ex: npm install -g typescript-tools
"NeoBundle 'leafgarland/typescript-vim'
"NeoBundle 'clausreinke/typescript-tools'

" ------------------------------------------------------------------------------
"  履歴管理
" ------------------------------------------------------------------------------
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'sjl/gundo.vim'

" ------------------------------------------------------------------------------
"  スニペット集
" ------------------------------------------------------------------------------
NeoBundle 'honza/vim-snippets'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

" ------------------------------------------------------------------------------
"  テキスト編集
" ------------------------------------------------------------------------------
NeoBundle 'tpope/vim-surround'
NeoBundle 'sakuraiyuta/commentout.vim'
NeoBundle 'osyo-manga/vim-over'
"NeoBundle 'kana/vim-smartinput'

" ------------------------------------------------------------------------------
"  構文チェック
" ------------------------------------------------------------------------------
NeoBundle 'scrooloose/syntastic'
NeoBundle 'jiangmiao/simple-javascript-indenter'

" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

" ------------------------------------------------------------------------------
"  構文カラーリング
" ------------------------------------------------------------------------------
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'tomasr/molokai'
NeoBundle 'jeffreyiacono/vim-colors-wombat'

" ------------------------------------------------------------------------------
"  エディタ拡張
" ------------------------------------------------------------------------------
NeoBundle 'bling/vim-airline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 235
let g:indentLine_char = '¦'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
NeoBundle 'vim-scripts/matchit.zip'

" ------------------------------------------------------------------------------
"  検索
" ------------------------------------------------------------------------------
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ------------------------------------------------------------------------------
"  フォーマット拡張
" ------------------------------------------------------------------------------
NeoBundle 'maksimr/vim-jsbeautify'

" ------------------------------------------------------------------------------
"  ObjC拡張
" ------------------------------------------------------------------------------
if has('mac')
    NeoBundle 'tokorom/clang_complete'
    NeoBundle 'tokorom/clang_complete-getopts-ios'
    let g:clang_auto_user_options = 'path, .clang_complete, ios'
    let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
    let g:clang_complete_getopts_ios_sdk_directory = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk'
endif

" ------------------------------------------------------------------------------
"  Git拡張
" ------------------------------------------------------------------------------
NeoBundle 'tpope/vim-fugitive'

" ------------------------------------------------------------------------------
"  CLIブラウザ
" ------------------------------------------------------------------------------
"NeoBundle 'yuratomo/w3m.vim'

" ------------------------------------------------------------------------------
"  デバッグツール
" ------------------------------------------------------------------------------
NeoBundle 'thinca/vim-quickrun'


" ------------------------------------------------------------------------------
"  Preview
" ------------------------------------------------------------------------------
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

let g:vim_markdown_folding_disabled=1

" JSONファイルのクォーテーション
"NeoBundle 'elzr/vim-json'
"let g:vim_json_syntax_conceal = 0

call neobundle#end()

" ------------------------------------------------------------------------------
"  一般設定
" ------------------------------------------------------------------------------
filetype plugin indent on " Required!
filetype indent on
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" 強調表示設定
syntax on
" カラースキーマ設定
colorscheme wombat
" colorscheme base16-duotone-dark
" or any of the other schemes:
" colorscheme base16-duotone-darkearth
" colorscheme base16-duotone-darkdesert
" colorscheme base16-duotone-darkforest
" colorscheme base16-duotone-darkpark
" colorscheme base16-duotone-darkmeadow
" colorscheme base16-duotone-darksea
" colorscheme base16-duotone-darkpool
" colorscheme base16-duotone-darkspace
" colorscheme base16-duotone-dark
" colorscheme base16-duotone-darkheath
" colorscheme base16-duotone-darkcave
" カーソル行のハイライト
set cursorline
nnoremap <Leader>c :<C-u>setlocal cursorline!<CR>
nnoremap <Leader><Leader>c :<C-u>setlocal cursorcolumn!<CR>
" 特殊な記号用
set ambiwidth=double
" ステータスライン設定
set laststatus=2
"ターミナルで256色表示を使う
set t_Co=256
" 検索で、大文字小文字を区別しない
set ignorecase
" 検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set wrapscan
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライトする
set hlsearch
" タブの代わりに空白文字を挿入する
set expandtab
" タブ幅設定
set tabstop=2
" 行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
" 自動インデントを無効にする
set noautoindent
" バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vim/backup
" スワップファイル用のディレクトリ
set directory=$HOME/.vim/swap
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" ツールバー非表示
set guioptions-=T
" クリップボード共有トグル
"nnoremap <Leader>p :<C-u>setlocal clipboard=unnamed,autoselect<CR>
" Backspaceキーを有効にする
set backspace=indent,eol,start
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen

set foldmethod=marker
set foldlevel=0
" ------------------------------------------------------------------------------
"  汎用設定
" ------------------------------------------------------------------------------

" 全角スペースのハイライトを設定
function! ZenkakuSpace()
    hi ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666 gui=underline guifg=darkgrey
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
        autocmd ColorScheme       * call ZenkakuSpace()
        " 全角スペースのハイライト指定
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" ------------------------------------------------------------------------------
"  カラー設定
" ------------------------------------------------------------------------------

" diff関連
hi DiffAdd      ctermbg=236
hi DiffChange   ctermbg=236
hi DiffDelete   ctermfg=125      ctermbg=236
hi DiffText     ctermfg=218      ctermbg=236
" fold時関連
hi FoldColumn   ctermfg=2        ctermbg=234
hi Folded       ctermfg=2        ctermbg=234
" 分割関連
hi VertSplit    ctermfg=236      ctermbg=gray
" カーソル関連
hi CursorColumn ctermbg=234      cterm=none
hi CursorLine   ctermbg=234      cterm=none
hi NonText      ctermfg=darkgrey ctermbg=none term=bold
hi LineNr       ctermfg=gray     ctermbg=234
hi CursorLineNr ctermfg=DarkRed  ctermbg=234
hi SpecialKey   ctermfg=darkgrey term=none cterm=none
hi Pmenu        ctermfg=grey     ctermbg=234
hi PmenuSel     ctermfg=grey     ctermbg=235
hi PmenuSbar    ctermbg=235
hi Visual       ctermfg=white    ctermbg=DarkRed
" ソースコード汎用関連
hi String       ctermfg=174
hi Comment      ctermfg=8
hi Constant     ctermfg=DarkRed
hi Function     ctermfg=66
hi Type         ctermfg=254
hi Statement    ctermfg=107
hi Keyword      ctermfg=80
" TODO
hi Todo ctermfg=white ctermbg=DarkRed
hi javaScriptCommentTodo ctermfg=white ctermbg=DarkRed

" ------------------------------------------------------------------------------
"  カラーカスタマイズ用関数
" ------------------------------------------------------------------------------

function! s:get_syn_id(transparent)
    let synid = synID(line("."), col("."), 1)
    if a:transparent
        return synIDtrans(synid)
    else
        return synid
    endif
endfunction
function! s:get_syn_attr(synid)
    let name = synIDattr(a:synid, "name")
    let ctermfg = synIDattr(a:synid, "fg", "cterm")
    let ctermbg = synIDattr(a:synid, "bg", "cterm")
    let guifg = synIDattr(a:synid, "fg", "gui")
    let guibg = synIDattr(a:synid, "bg", "gui")
    return {
                \ "name": name,
                \ "ctermfg": ctermfg,
                \ "ctermbg": ctermbg,
                \ "guifg": guifg,
                \ "guibg": guibg}
endfunction
function! s:get_syn_info()
    let baseSyn = s:get_syn_attr(s:get_syn_id(0))
    echo "name: " . baseSyn.name .
                \ " ctermfg: " . baseSyn.ctermfg .
                \ " ctermbg: " . baseSyn.ctermbg .
                \ " guifg: " . baseSyn.guifg .
                \ " guibg: " . baseSyn.guibg
    let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
    echo "link to"
    echo "name: " . linkedSyn.name .
                \ " ctermfg: " . linkedSyn.ctermfg .
                \ " ctermbg: " . linkedSyn.ctermbg .
                \ " guifg: " . linkedSyn.guifg .
                \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()"

" ------------------------------------------------------------------------------
"  キーマップ設定
" ------------------------------------------------------------------------------

" タブ移動
map <silent> <C-K> :tabnext<CR>
map <silent> <C-A> :tabprev<CR>
" Unite系統の設定
map <F2> :<C-u>Unite bookmark -default-action=lcd<CR>
map <F3> :VimFiler<CR>
map <F4> :Unite file_mru<CR>
map <F5> :Unite tab<CR>
map <C-w> :Unite buffer<CR>
map <F6> :QuickRun<CR>
" vキー2回で文末まで選択
vnoremap v $h
" 表示行単位で上下移動
nnoremap <silent> j gj
nnoremap <silent> k gk
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" 検索実行時にカーソル位置を常に中央に移動させる
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" Ctrl+e で文末移動
map <C-a> <ESC>^
map <C-e> <ESC>$
imap <C-e> <ESC>$i<Right>
" Spaceでカーソル中央スクロール
map <Space> zzj
"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>

" ------------------------------------------------------------------------------
"  W3mキーバインド設定
" ------------------------------------------------------------------------------
nnoremap <leader>w :W3mTab google 

" ------------------------------------------------------------------------------
"  VimFiler
" ------------------------------------------------------------------------------
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_enable_auto_cd=1
nnoremap <silent> <ESC>b :<C-u>Unite bookmark -default-action=lcd<CR>


" ------------------------------------------------------------------------------
"  Gundo
" ------------------------------------------------------------------------------
nnoremap <Leader>g :GundoToggle<CR>

" ------------------------------------------------------------------------------
"  Unite
" ------------------------------------------------------------------------------
let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> ,gy :<C-u>Unite history/yank<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" ------------------------------------------------------------------------------
"  Unite outline
" ------------------------------------------------------------------------------
let g:unite_split_rule = 'botright'
nnoremap <silent> \\ :<C-u>Unite -vertical -toggle -no-quit -winwidth=45 outline<CR>

" ------------------------------------------------------------------------------
"  Unite sendto
" ------------------------------------------------------------------------------
let g:vimfiler_sendto = {
            \   'unzip' : 'unzip %f'
            \ , 'zip' : 'zip -r %F.zip %*'
            \ , 'cleanzip' : 'zip -d %f *.DS_Store'
            \ }

" ------------------------------------------------------------------------------
"  Anywhere SID.
" ------------------------------------------------------------------------------
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" Tab jump
" 例: t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

" ------------------------------------------------------------------------------
"  airline
" ------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ------------------------------------------------------------------------------
"  syntastic
" ------------------------------------------------------------------------------
let g:syntastic_mode_map = {
            \  'mode': 'active',
            \ 'active_filetypes': ['javascript', 'ruby'],
            \ 'passive_filetypes': []
            \ }
let g:syntastic_check_on_open=0             "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1             "保存時にはチェック
let g:syntastic_auto_loc_list=0             "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6           "エラー表示ウィンドウの高さ
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_javascript_eslint_conf = '.eslintrc'
"let g:syntastic_javascript_jshint_conf = '~/.jshintrc'

"エラー表示マークを変更
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

hi SyntasticErrorSign        term=standout  ctermfg=9 ctermbg=none
hi SyntasticWarning          term=underline ctermfg=9 ctermbg=none
hi SyntasticWarningSign      term=underline ctermfg=9 ctermbg=none
hi SyntasticStyleWarningSign term=underline ctermfg=9 ctermbg=none
hi SyntasticError            ctermbg=none   ctermfg=203
hi SyntasticStyleError       ctermbg=none   ctermfg=203
hi Error                     ctermbg=none   ctermfg=203
hi SignColumn                ctermbg=none

" ------------------------------------------------------------------------------
"  Python設定
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  CoffeeScript設定
" ------------------------------------------------------------------------------
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee   "拡張子認識
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et             "インデント設定

" ------------------------------------------------------------------------------
"  ActionScript設定
" ------------------------------------------------------------------------------
au BufNewFile,BufRead *.as set filetype=actionscript

" ------------------------------------------------------------------------------
"  NeoBundleチェック
" ------------------------------------------------------------------------------
NeoBundleCheck

" EOF
