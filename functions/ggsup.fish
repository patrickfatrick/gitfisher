function ggsup -d "git set upstream to origin/<current branch>"
  git branch --set-upstream-to=origin/(__git_current_branch)
end
