vim.cmd[[
  let g:fzf_tags_command = 'ctags -R'
  let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
  let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
]]

vim.cmd[[
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
]]

vim.cmd[[
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --glob "!.git/*" --glob "!arun-cerbero" --glob "!arun-gst-plugins-bad" '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
]]
