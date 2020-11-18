function git-svn-dcommit-push -w "git svn" -d "???"
  git svn dcommit
  git push github master:svntrunk
end