function ggfl -w "git push" -d "do a push to the remote for the current branch using --force-with-lease"
  git push --force-with-lease origin (__git.current_branch)
end