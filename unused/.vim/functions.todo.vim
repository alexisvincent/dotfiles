function! ToggleTodayTodo()
  let currentLine = getline(".")
  if currentLine =~ "TODAY$"
    execute "normal! mm$diw\`m"
  else
    execute "normal! mm"
    execute "normal! $a                                                         "
    execute "normal! 73|"
    execute "normal d$"
    execute "normal aTODAY"
    execute "normal! 0`m"
  endif
endfunction

function! ToggleTomorrowTodo()
  let currentLine = getline(".")
  if currentLine =~ "TOMORROW$"
    execute "normal! mm$diw\`m"
  else
    execute "normal! mm"
    execute "normal! $a                                                         "
    execute "normal! 70|"
    execute "normal d$"
    execute "normal aTOMORROW"
    execute "normal! 0`m"
  endif
endfunction
