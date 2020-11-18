function gdnolock -w "git diff" -d "git diff except ignoring lock files"
  git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"
end