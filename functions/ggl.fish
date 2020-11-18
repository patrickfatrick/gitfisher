function ggl -w "git pull origin master" -d "git pull origin <current branch>"
  git pull origin (__git_current_branch) $argv
end
