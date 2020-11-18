set -l install_event (basename (status -f) .fish)_install
set -l update_event (basename (status -f) .fish)_update
set -l uninstall_event (basename (status -f) .fish)_uninstall

function __gitfish_init
  function __gitfish_create_abbr -d "Create Git plugin abbreviation"
    set -l name $argv[1]
    set -l body $argv[2..-1]
    abbr -a $name $body
    set __git_plugin_abbreviations -a $name
  end

  set -q __git_plugin_initialized; and exit 0

  set -U __git_plugin_abbreviations

  # git abbreviations
__gitfish_create_abbr g          git
__gitfish_create_abbr ga         git add
__gitfish_create_abbr gaa        git add --all
__gitfish_create_abbr gapa       git add --patch
__gitfish_create_abbr gau        git add --update
__gitfish_create_abbr gav        git add --verbose
__gitfish_create_abbr gap        git apply
__gitfish_create_abbr gapt       git apply --3way
__gitfish_create_abbr gb         git branch
__gitfish_create_abbr gba        git branch -a
__gitfish_create_abbr gbd        git branch -d
__gitfish_create_abbr gbD        git branch -D
__gitfish_create_abbr gbl        git blame -b -w
__gitfish_create_abbr gbnm       git branch --no-merged
__gitfish_create_abbr gbr        git branch --remote
__gitfish_create_abbr gbs        git bisect
__gitfish_create_abbr gbsb       git bisect bad
__gitfish_create_abbr gbsg       git bisect good
__gitfish_create_abbr gbsr       git bisect reset
__gitfish_create_abbr gbss       git bisect start
__gitfish_create_abbr gc         git commit -v
__gitfish_create_abbr gc!        git commit -v --amend
__gitfish_create_abbr gcn!       git commit -v --no-edit --amend
__gitfish_create_abbr gca        git commit -v -a
__gitfish_create_abbr gca!       git commit -v -a --amend
__gitfish_create_abbr gcan!      git commit -v -a --no-edit --amend
__gitfish_create_abbr gcans!     git commit -v -a -s --no-edit --amend
__gitfish_create_abbr gcam       git commit -a -m
__gitfish_create_abbr gcsm       git commit -s -m
__gitfish_create_abbr gcb        git checkout -b
__gitfish_create_abbr gcf        git config --list
__gitfish_create_abbr gcl        git clone --recurse-submodules
__gitfish_create_abbr gclean     git clean -id
__gitfish_create_abbr gpristine  git reset --hard && git clean -dffx
__gitfish_create_abbr gcm        git checkout master
__gitfish_create_abbr gcd        git checkout develop
__gitfish_create_abbr gcmsg      git commit -m
__gitfish_create_abbr gco        git checkout
__gitfish_create_abbr gcount     git shortlog -sn
__gitfish_create_abbr gcp        git cherry-pick
__gitfish_create_abbr gcpa       git cherry-pick --abort
__gitfish_create_abbr gcpc       git cherry-pick --continue
__gitfish_create_abbr gcs        git commit -S
__gitfish_create_abbr gd         git diff
__gitfish_create_abbr gdca       git diff --cached
__gitfish_create_abbr gdcw       git diff --cached --word-diff
__gitfish_create_abbr gdct       git describe --tags (git rev-list --tags --max-count=1)
__gitfish_create_abbr gds        git diff --staged
__gitfish_create_abbr gdw        git diff --word-diff
__gitfish_create_abbr gf         git fetch
__gitfish_create_abbr gfa        git fetch --all --prune
__gitfish_create_abbr gfg        git ls-files | grep
__gitfish_create_abbr gfo        git fetch origin
__gitfish_create_abbr gg         git gui citool
__gitfish_create_abbr gga        git gui citool --amend
__gitfish_create_abbr ghh        git help
__gitfish_create_abbr gignore    git update-index --assume-unchanged
__gitfish_create_abbr gignored   git ls-files -v | grep "^[[:lower:]]"
__gitfish_create_abbr gk         gitk --all --branches
__gitfish_create_abbr gke        gitk --all (git log -g --pretty=%h)
__gitfish_create_abbr gl         git pull
__gitfish_create_abbr glg        git log --stat
__gitfish_create_abbr glgp       git log --stat -p
__gitfish_create_abbr glgg       git log --graph
__gitfish_create_abbr glgga      git log --graph --decorate --all
__gitfish_create_abbr glgm       git log --graph --max-count=10
__gitfish_create_abbr glo        git log --oneline --decorate
__gitfish_create_abbr glol       git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
__gitfish_create_abbr glols      git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat
__gitfish_create_abbr glod       git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'
__gitfish_create_abbr glods      git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short
__gitfish_create_abbr glola      git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
__gitfish_create_abbr glog       git log --oneline --decorate --graph
__gitfish_create_abbr gloga      git log --oneline --decorate --graph --all
__gitfish_create_abbr glp        git log --pretty=<format>
__gitfish_create_abbr gm         git merge
__gitfish_create_abbr gmom       git merge origin/master
__gitfish_create_abbr gmt        git mergetool --no-prompt
__gitfish_create_abbr gmtvim     git mergetool --no-prompt --tool=vimdiff
__gitfish_create_abbr gmum       git merge upstream/master
__gitfish_create_abbr gma        git merge --abort
__gitfish_create_abbr gp         git push
__gitfish_create_abbr gpd        git push --dry-run
__gitfish_create_abbr gpf        git push --force-with-lease
__gitfish_create_abbr gpf!       git push --force
__gitfish_create_abbr gpu        git push upstream
__gitfish_create_abbr gpv        git push -v
__gitfish_create_abbr gr         git remote
__gitfish_create_abbr gra        git remote add
__gitfish_create_abbr grb        git rebase
__gitfish_create_abbr grba       git rebase --abort
__gitfish_create_abbr grbc       git rebase --continue
__gitfish_create_abbr grbd       git rebase develop
__gitfish_create_abbr grbi       git rebase -i
__gitfish_create_abbr grbm       git rebase master
__gitfish_create_abbr grbs       git rebase --skip
__gitfish_create_abbr grev       git revert
__gitfish_create_abbr grh        git reset
__gitfish_create_abbr grhh       git reset --hard
__gitfish_create_abbr grm        git rm
__gitfish_create_abbr grmc       git rm --cached
__gitfish_create_abbr grmv       git remote rename
__gitfish_create_abbr grrm       git remote remove
__gitfish_create_abbr grs        git restore
__gitfish_create_abbr grset      git remote set-url
__gitfish_create_abbr grss       git restore --source
__gitfish_create_abbr gru        git reset --
__gitfish_create_abbr grup       git remote update
__gitfish_create_abbr grv        git remote -v
__gitfish_create_abbr gsb        git status -sb
__gitfish_create_abbr gsd        git svn dcommit
__gitfish_create_abbr gsh        git show
__gitfish_create_abbr gsi        git submodule init
__gitfish_create_abbr gsps       git show --pretty=short --show-signature
__gitfish_create_abbr gsr        git svn rebase
__gitfish_create_abbr gss        git status -s
__gitfish_create_abbr gst        git status
__gitfish_create_abbr gsta       git stash push
__gitfish_create_abbr gsta       git stash save
__gitfish_create_abbr gstaa      git stash apply
__gitfish_create_abbr gstc       git stash clear
__gitfish_create_abbr gstd       git stash drop
__gitfish_create_abbr gstl       git stash list
__gitfish_create_abbr gstp       git stash pop
__gitfish_create_abbr gsts       git stash show --text
__gitfish_create_abbr gstu       git stash --include-untracked
__gitfish_create_abbr gstall     git stash --all
__gitfish_create_abbr gsu        git submodule update
__gitfish_create_abbr gsw        git switch
__gitfish_create_abbr gswc       git switch -c
__gitfish_create_abbr gts        git tag -s
__gitfish_create_abbr gtv        git tag | sort -V
__gitfish_create_abbr gunignore  git update-index --no-assume-unchanged
__gitfish_create_abbr gup        git pull --rebase
__gitfish_create_abbr gupv       git pull --rebase -v
__gitfish_create_abbr gupa       git pull --rebase --autostash
__gitfish_create_abbr gupav      git pull --rebase --autostash -v
__gitfish_create_abbr glum       git pull upstream master
__gitfish_create_abbr gwch       git whatchanged -p --abbrev-commit --pretty=medium
__gitfish_create_abbr gam        git am
__gitfish_create_abbr gamc       git am --continue
__gitfish_create_abbr gams       git am --skip
__gitfish_create_abbr gama       git am --abort
__gitfish_create_abbr gamscp     git am --show-current-patch

  # Cleanup declared functions
  functions -e __gitfish_create_abbr

  # Mark git plugin as initialized
  set -U __git_plugin_initialized (date)
end

function __gitfish_destroy
  for ab in $__git_plugin_abbreviations
      abbr -e $ab
  end
  set -Ue __git_plugin_abbreviations
  set -Ue __git_plugin_initialized
end

function $install_event --on-event $install_event
  __gitfish_init
end

function $update_event --on-event $update_event
  __gitfish_destroy
  __gitfish_init
end

function $uninstall_event --on-event $uninstall_event
  __gitfish_destroy
end
