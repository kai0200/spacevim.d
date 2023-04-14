func! myspacevim#before() abort

  " ------------------- START  -----------------------
  " 增加spacevim 背景透明模式
  func! s:transparent_background()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
  endf
  autocmd ColorScheme * call s:transparent_background()

  " 设置可以高亮的关键字
  if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
      autocmd  FileType c,py,sh call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
      autocmd  FileType c,py,sh call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
  endif

  " 自定义自己的spc快捷键
  " -------------------------
  " vim-table-mode  Markdown 文件自动制表
  call SpaceVim#custom#SPCGroupName(['k'], '+快速')
  call SpaceVim#custom#SPC('nore', ['k', 't'], 'TableModeToggle', 'MarkDown Tables', 1)
  " markdown table
  " map <leader>mt :TableModeToggle<cr>
  " 配置markdown快速编辑键 {{{
  autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
  autocmd Filetype markdown inoremap <buffer> <leader>f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
  autocmd Filetype markdown inoremap <buffer> <leader>w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
  autocmd Filetype markdown inoremap <buffer> <leader>n ---<Enter><Enter>
  autocmd Filetype markdown inoremap <buffer> <leader>b **** <++><Esc>F*hi
  autocmd Filetype markdown inoremap <buffer> <leader>s ~~~~ <++><Esc>F~hi
  autocmd Filetype markdown inoremap <buffer> <leader>i ** <++><Esc>F*i
  autocmd Filetype markdown inoremap <buffer> <leader>d `` <++><Esc>F`i
  autocmd Filetype markdown inoremap <buffer> <leader>c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
  autocmd Filetype markdown inoremap <buffer> <leader>m - [ ]
  autocmd Filetype markdown inoremap <buffer> <leader>p ![](<++>) <++><Esc>F[a
  autocmd Filetype markdown inoremap <buffer> <leader>a [](<++>) <++><Esc>F[a
  autocmd Filetype markdown inoremap <buffer> <leader>1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>4 ####<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> <leader>l --------<Enter>
  autocmd Filetype markdown inoremap <buffer> <leader>p3 ###<Space> <++> - 项目组合 ###<Esc>I,f
  autocmd Filetype markdown inoremap <buffer> <leader>p4 ####<Space> <++> - 项目组合 ####F[a
  "}}}

  " 让file tree 显示文件图标，需要 terminal 安装 nerd font
  let g:spacevim_enable_vimfiler_filetypeicon = 1

  " ------------------- END -----------------------
  "
endf

func! myspacevim#after() abort
  " ------------------- START  -----------------------

  " 代码折叠
  " 折叠方法
  " manual    手工折叠
  " indent    使用缩进表示折叠
  " expr      使用表达式定义折叠
  " syntax    使用语法定义折叠
  " diff      对没有更改的文本进行折叠
  " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
  " set foldmethod=indent
  " set foldlevel=99

  " F1 废弃这个键,防止调出系统帮助
  " I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
  noremap <F1> <Esc>"


  " Go to home and end using capitalized directions
  noremap H ^
  noremap L $

  " 交换 ' `, 使得可以快速使用'跳到marked位置
  nnoremap ' `
  nnoremap ` '

  " switch # *
  nnoremap # *
  nnoremap * #

  " 复制选中区到系统剪切板中
  vnoremap <leader>y "+y

  " 分屏窗口移动, Smart way to move between windows
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l

  " <F5>
  set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to

  " F10 run
  "map <F10> :call SpaceVim#plugins#runner#open()<CR>
  noremap <F10> :call SpaceVim#plugins#runner#open()<CR>


  " ------------------- END -----------------------
endf
