function ggf -w "git push" -d "do a hard push to the remote for the current branch"
  git push --force origin (__git.current_branch)
end