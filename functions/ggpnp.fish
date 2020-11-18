function ggpnp -d "git pull & push origin <current branch>"
  git pull origin (__git_current_branch); and git push origin (__git_current_branch)
end
