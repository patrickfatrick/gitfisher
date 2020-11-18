function gtv -w "git tag" -d "list tags, sorted"
  git tag | sort -V
end