function ls --wraps='exa -la --icons' --wraps='exa -a --icons' --wraps='exa --icons' --description 'alias ls exa --icons'
  exa --icons $argv
        
end
