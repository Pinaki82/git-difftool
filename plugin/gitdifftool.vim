" Last Change: 2023-05-27  Saturday: 09:05:26 PM
"  ============================================================================
"  Basic GIT Operations. git difftool & git status
"  Plugin By: Pinaki Sekhar Gupta
"  ============================================================================
"  =====================================================================================
"
" http://vi.stackexchange.com/questions/2572/detect-os-in-vimscript
" google: detecting os from vimscript
if !exists("g:osdetected")
  if has("win64") || has("win32") || has("win16")
    let g:osdetected = "Windows"
  else
    let g:osdetected = substitute(system('uname'), '\n', '', '')
  endif
endif
"
"  =====================================================================================
"  Run GIT Difftool
"  =====================================================================================
"
function! GitDifftool()
  if g:osdetected == "Windows"
    :!start /min cmd /c git difftool
  elseif g:osdetected != "Windows"
    :Gina! difftool   " https://github.com/lambdalisue/gina.vim.git
    ":!git difftool " Not tested on Linux
  endif
endfunction
"
"  =====================================================================================
"  Check GIT Status
"  =====================================================================================
"
function! GitStatus()
  if g:osdetected == "Windows"
    :!git status
  elseif g:osdetected != "Windows"
    :Gina! status    " https://github.com/lambdalisue/gina.vim.git
    ":!git status " Not tested on Linux
  endif
endfunction
"
"  =====================================================================================
"  Check GIT Status with Gina https://github.com/lambdalisue/gina.vim.git
"  =====================================================================================
"
function! GinaStatus()
  :Gina! status
endfunction
"
"  =====================================================================================
"  Run gitk
"  =====================================================================================
"
function! GitK()
  if g:osdetected == "Windows"
    :!start /min cmd /c gitk
  elseif g:osdetected != "Windows"    " Not tested on Linux
    :silent!!gitk &
  endif
endfunction
"
"  =====================================================================================
"  Run git-cola
"  =====================================================================================
"
function! GitCola()
  if g:osdetected == "Windows"
    :!start /min cmd /c git-cola
  elseif g:osdetected != "Windows"    " Not tested on Linux
    :silent!!git-cola &
  endif
endfunction

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:amenu Plugin.GIT.GIT\ Difftool\ \(\:Diftl) :call GitDifftool() <Esc><Esc>
command! Diftl :call GitDifftool() <Esc><Esc>
:amenu Plugin.GIT.GIT\ Status\ \(\:Gstat) :call GitStatus() <Esc><Esc>
command! Gstat :call GitStatus() <Esc><Esc>
:amenu Plugin.GIT.Gina\ Status\ \(\:\Gina!\ \status) :call GinaStatus() <Esc><Esc>
:amenu Plugin.GIT.gitk\ \(\:Gitk) :call GitK() <Esc><Esc>
command! Gitk :call GitK() <Esc><Esc>
:amenu Plugin.GIT.git-cola\ \(\:GitCola) :call GitCola() <Esc><Esc>
command! GitCola :call GitCola() <Esc><Esc>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
