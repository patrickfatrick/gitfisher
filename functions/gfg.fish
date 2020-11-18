function gfg -w "git ls-files" -d "grep the files known to git"
  git ls-files | grep $argv
end