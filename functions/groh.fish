function groh -w "git reset" -d "reset the current branch back to HEAD"
  git reset origin/(__git_current_branch) --hard
end