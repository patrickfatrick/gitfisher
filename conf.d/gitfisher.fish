set -l event_name_base (basename (status -f) .fish)
set -l install_event (echo $event_name_base)_install
set -l update_event (echo $event_name_base)_update
set -l uninstall_event (echo $event_name_base)_uninstall

function __gitfisher_init
  function __gitfisher_create_abbr -d "Create Git plugin abbreviation"
    set -l name $argv[1]
    set -l body $argv[2..-1]
    abbr -a $name $body
    set -a __git_plugin_abbreviations $name
  end

  set -q __git_plugin_initialized; and exit 0

  set -U __git_plugin_abbreviations

  __gitfisher_create_abbr g          git
  __gitfisher_create_abbr ga         git add
  __gitfisher_create_abbr gaa        git add --all
  __gitfisher_create_abbr gapa       git add --patch
  __gitfisher_create_abbr gau        git add --update
  __gitfisher_create_abbr gav        git add --verbose
  __gitfisher_create_abbr gap        git apply
  __gitfisher_create_abbr gapt       git apply --3way
  __gitfisher_create_abbr gb         git branch
  __gitfisher_create_abbr gba        git branch -a
  __gitfisher_create_abbr gbd        git branch -d
  __gitfisher_create_abbr gbD        git branch -D
  __gitfisher_create_abbr gbl        git blame -b -w
  __gitfisher_create_abbr gbnm       git branch --no-merged
  __gitfisher_create_abbr gbr        git branch --remote
  __gitfisher_create_abbr gbs        git bisect
  __gitfisher_create_abbr gbsb       git bisect bad
  __gitfisher_create_abbr gbsg       git bisect good
  __gitfisher_create_abbr gbsr       git bisect reset
  __gitfisher_create_abbr gbss       git bisect start
  __gitfisher_create_abbr gc         git commit -v
  __gitfisher_create_abbr gc!        git commit -v --amend
  __gitfisher_create_abbr gcn!       git commit -v --no-edit --amend
  __gitfisher_create_abbr gca        git commit -v -a
  __gitfisher_create_abbr gca!       git commit -v -a --amend
  __gitfisher_create_abbr gcan!      git commit -v -a --no-edit --amend
  __gitfisher_create_abbr gcans!     git commit -v -a -s --no-edit --amend
  __gitfisher_create_abbr gcam       git commit -a -m
  __gitfisher_create_abbr gcsm       git commit -s -m
  __gitfisher_create_abbr gcb        git checkout -b
  __gitfisher_create_abbr gcf        git config --list
  __gitfisher_create_abbr gcl        git clone --recurse-submodules
  __gitfisher_create_abbr gclean     git clean -id
  __gitfisher_create_abbr gpristine  git reset --hard; and git clean -dffx
  __gitfisher_create_abbr gcm        git checkout master
  __gitfisher_create_abbr gcd        git checkout develop
  __gitfisher_create_abbr gcmsg      git commit -m
  __gitfisher_create_abbr gco        git checkout
  __gitfisher_create_abbr gcount     git shortlog -sn
  __gitfisher_create_abbr gcp        git cherry-pick
  __gitfisher_create_abbr gcpa       git cherry-pick --abort
  __gitfisher_create_abbr gcpc       git cherry-pick --continue
  __gitfisher_create_abbr gcs        git commit -S
  __gitfisher_create_abbr gd         git diff
  __gitfisher_create_abbr gdca       git diff --cached
  __gitfisher_create_abbr gdcw       git diff --cached --word-diff
  __gitfisher_create_abbr gdct       git describe --tags (git rev-list --tags --max-count=1)
  __gitfisher_create_abbr gds        git diff --staged
  __gitfisher_create_abbr gdw        git diff --word-diff
  __gitfisher_create_abbr gf         git fetch
  __gitfisher_create_abbr gfa        git fetch --all --prune --jobs=10
  __gitfisher_create_abbr gfo        git fetch origin
  __gitfisher_create_abbr gg         git gui citool
  __gitfisher_create_abbr gga        git gui citool --amend
  __gitfisher_create_abbr ghh        git help
  __gitfisher_create_abbr gignore    git update-index --assume-unchanged
  __gitfisher_create_abbr gk         gitk --all --branches
  __gitfisher_create_abbr gke        gitk --all (git log -g --pretty=%h)
  __gitfisher_create_abbr gl         git pull
  __gitfisher_create_abbr glg        git log --stat
  __gitfisher_create_abbr glgp       git log --stat -p
  __gitfisher_create_abbr glgg       git log --graph
  __gitfisher_create_abbr glgga      git log --graph --decorate --all
  __gitfisher_create_abbr glgm       git log --graph --max-count=10
  __gitfisher_create_abbr glo        git log --oneline --decorate
  __gitfisher_create_abbr glol       git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
  __gitfisher_create_abbr glols      git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat
  __gitfisher_create_abbr glod       git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'
  __gitfisher_create_abbr glods      git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short
  __gitfisher_create_abbr glola      git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
  __gitfisher_create_abbr glog       git log --oneline --decorate --graph
  __gitfisher_create_abbr gloga      git log --oneline --decorate --graph --all
  __gitfisher_create_abbr gm         git merge
  __gitfisher_create_abbr gmom       git merge origin/master
  __gitfisher_create_abbr gmt        git mergetool --no-prompt
  __gitfisher_create_abbr gmtvim     git mergetool --no-prompt --tool=vimdiff
  __gitfisher_create_abbr gmum       git merge upstream/master
  __gitfisher_create_abbr gma        git merge --abort
  __gitfisher_create_abbr gp         git push
  __gitfisher_create_abbr gpd        git push --dry-run
  __gitfisher_create_abbr gpf        git push --force-with-lease
  __gitfisher_create_abbr gpf!       git push --force
  __gitfisher_create_abbr gpu        git push upstream
  __gitfisher_create_abbr gpv        git push -v
  __gitfisher_create_abbr gr         git remote
  __gitfisher_create_abbr gra        git remote add
  __gitfisher_create_abbr grb        git rebase
  __gitfisher_create_abbr grba       git rebase --abort
  __gitfisher_create_abbr grbc       git rebase --continue
  __gitfisher_create_abbr grbd       git rebase develop
  __gitfisher_create_abbr grbi       git rebase -i
  __gitfisher_create_abbr grbm       git rebase master
  __gitfisher_create_abbr grbs       git rebase --skip
  __gitfisher_create_abbr grev       git revert
  __gitfisher_create_abbr grh        git reset
  __gitfisher_create_abbr grhh       git reset --hard
  __gitfisher_create_abbr grm        git rm
  __gitfisher_create_abbr grmc       git rm --cached
  __gitfisher_create_abbr grmv       git remote rename
  __gitfisher_create_abbr grrm       git remote remove
  __gitfisher_create_abbr grs        git restore
  __gitfisher_create_abbr grset      git remote set-url
  __gitfisher_create_abbr grss       git restore --source
  __gitfisher_create_abbr gru        git reset --
  __gitfisher_create_abbr grup       git remote update
  __gitfisher_create_abbr grv        git remote -v
  __gitfisher_create_abbr gsb        git status -sb
  __gitfisher_create_abbr gsd        git svn dcommit
  __gitfisher_create_abbr gsh        git show
  __gitfisher_create_abbr gsi        git submodule init
  __gitfisher_create_abbr gsps       git show --pretty=short --show-signature
  __gitfisher_create_abbr gsr        git svn rebase
  __gitfisher_create_abbr gss        git status -s
  __gitfisher_create_abbr gst        git status
  __gitfisher_create_abbr gsta       git stash push
  __gitfisher_create_abbr gstaa      git stash apply
  __gitfisher_create_abbr gstc       git stash clear
  __gitfisher_create_abbr gstd       git stash drop
  __gitfisher_create_abbr gstl       git stash list
  __gitfisher_create_abbr gstp       git stash pop
  __gitfisher_create_abbr gsts       git stash show --text
  __gitfisher_create_abbr gstu       git stash --include-untracked
  __gitfisher_create_abbr gstall     git stash --all
  __gitfisher_create_abbr gsu        git submodule update
  __gitfisher_create_abbr gsw        git switch
  __gitfisher_create_abbr gswc       git switch -c
  __gitfisher_create_abbr gts        git tag -s
  __gitfisher_create_abbr gunignore  git update-index --no-assume-unchanged
  __gitfisher_create_abbr gup        git pull --rebase
  __gitfisher_create_abbr gupv       git pull --rebase -v
  __gitfisher_create_abbr gupa       git pull --rebase --autostash
  __gitfisher_create_abbr gupav      git pull --rebase --autostash -v
  __gitfisher_create_abbr glum       git pull upstream master
  __gitfisher_create_abbr gwch       git whatchanged -p --abbrev-commit --pretty=medium
  __gitfisher_create_abbr gam        git am
  __gitfisher_create_abbr gamc       git am --continue
  __gitfisher_create_abbr gams       git am --skip
  __gitfisher_create_abbr gama       git am --abort
  __gitfisher_create_abbr gamscp     git am --show-current-patch

  # Cleanup declared functions
  functions -e __gitfisher_create_abbr

  # Mark git plugin as initialized
  set -U __git_plugin_initialized (date)
end

function __gitfisher_destroy
  for ab in $__git_plugin_abbreviations
      abbr -e $ab
  end
  set -Ue __git_plugin_abbreviations
  set -Ue __git_plugin_initialized
end

function $install_event --on-event $install_event
  __gitfisher_init
end

function $update_event --on-event $update_event
  __gitfisher_destroy; and __gitfisher_init
end

function $uninstall_event --on-event $uninstall_event
  __gitfisher_destroy
end
