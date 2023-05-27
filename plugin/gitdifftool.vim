" Last Change: 2023-05-27  Saturday: 04:25:22 PM
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
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:amenu Plugin.GIT.GIT\ Difftool\ \(\:Diftl) :call GitDifftool() <Esc><Esc>
command! Diftl :call GitDifftool() <Esc><Esc>
:amenu Plugin.GIT.GIT\ Status\ \(\:Gstat) :call GitStatus() <Esc><Esc>
command! Gstat :call GitStatus() <Esc><Esc>
:amenu Plugin.GIT.Gina\ Status\ \(\:\Gina!\ \status) :call GinaStatus() <Esc><Esc>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
