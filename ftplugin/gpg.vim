augroup GnuPG
  autocmd!
  " do the decryption
  autocmd BufReadCmd <buffer> 
        \ call gnupg#GPGInit(1)
        \ call gnupg#GPGDecrypt(1)
  autocmd FileReadCmd <buffer>
        \ call gnupg#GPGInit(0)
        \ call gnupg#GPGDecrypt(0)
  " convert all text to encrypted text before writing
  " We check for GPGCorrespondingTo to avoid triggering on writes in GPG Options/Recipient windows
  autocmd BufWriteCmd,FileWriteCmd <buffer>
        \ if !exists('b:GPGCorrespondingTo')
        \   call gnupg#GPGInit(0)
        \   call gnupg#GPGEncrypt()
        \ endif
  " cleanup on leaving vim
  autocmd VimLeave <buffer> call gnupg#GPGCleanup()
augroup END
