function gdnolock
  git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"
end