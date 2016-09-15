if !exists('g:GPGFilePattern')
  let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)'
endif

execute 'autocmd BufRead,BufNewFile,BufFilePost ' . g:GPGFilePattern . ' setlocal filetype=gpg'

