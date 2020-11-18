set -l install_event (basename (status -f) .fish)_install
set -l update_event (basename (status -f) .fish)_update
set -l uninstall_event (basename (status -f) .fish)_uninstall

function __gitfish_init
  function __gitfish_create_abbr -d "Create Git plugin abbreviation"
    set -l name $argv[1]
    set -l body $argv[2..-1]
    abbr -a $name $body
    set __git_plugin_abbreviations $__git_plugin_abbreviations $name
  end

  set -q __git_plugin_initialized; and exit 0

  set -U __git_plugin_abbreviations

  # git abbreviations
  __gitfish_create_abbr g          git
  __gitfish_create_abbr ga         git add
  __gitfish_create_abbr gaa        git add --all
  __gitfish_create_abbr gapa       git add --patch
  __gitfish_create_abbr gap        git apply
  __gitfish_create_abbr gb         git branch -vv
  __gitfish_create_abbr gba        git branch -a -v
  __gitfish_create_abbr gban       git branch -a -v --no-merged
  __gitfish_create_abbr gbd        git branch -d
  __gitfish_create_abbr gbD        git branch -D
  __gitfish_create_abbr gbl        git blame -b -w
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
  __gitfish_create_abbr gcv        git commit -v --no-verify
  __gitfish_create_abbr gcav       git commit -a -v --no-verify
  __gitfish_create_abbr gcav!      git commit -a -v --no-verify --amend
  __gitfish_create_abbr gcm        git commit -m
  __gitfish_create_abbr gcam       git commit -a -m
  __gitfish_create_abbr gscam      git commit -S -a -m
  __gitfish_create_abbr gcfx       git commit --fixup
  __gitfish_create_abbr gcf        git config --list
  __gitfish_create_abbr gcl        git clone
  __gitfish_create_abbr gclean     git clean -di
  __gitfish_create_abbr gclean!    git clean -dfx
  __gitfish_create_abbr gclean!!   "git reset --hard; and git clean -dfx"
  __gitfish_create_abbr gcount     git shortlog -sn
  __gitfish_create_abbr gcp        git cherry-pick
  __gitfish_create_abbr gcpa       git cherry-pick --abort
  __gitfish_create_abbr gcpc       git cherry-pick --continue
  __gitfish_create_abbr gd         git diff
  __gitfish_create_abbr gdca       git diff --cached
  __gitfish_create_abbr gds        git diff --stat
  __gitfish_create_abbr gdsc       git diff --stat --cached
  __gitfish_create_abbr gdw        git diff --word-diff
  __gitfish_create_abbr gdwc       git diff --word-diff --cached
  __gitfish_create_abbr gignore    git update-index --assume-unchanged
  __gitfish_create_abbr gf         git fetch
  __gitfish_create_abbr gfa        git fetch --all --prune
  __gitfish_create_abbr gfm        "git fetch origin master --prune; and git merge FETCH_HEAD"
  __gitfish_create_abbr gfo        git fetch origin
  __gitfish_create_abbr gl         git pull
  __gitfish_create_abbr gll        git pull origin
  __gitfish_create_abbr glr        git pull --rebase
  __gitfish_create_abbr glg        git log --stat --max-count=10
  __gitfish_create_abbr glgg       git log --graph --max-count=10
  __gitfish_create_abbr glgga      git log --graph --decorate --all
  __gitfish_create_abbr glo        git log --oneline --decorate --color
  __gitfish_create_abbr glog       git log --oneline --decorate --color --graph
  __gitfish_create_abbr glom       git log --oneline --decorate --color master..
  __gitfish_create_abbr glod       git log --oneline --decorate --color develop..
  __gitfish_create_abbr gloo       "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
  __gitfish_create_abbr gm         git merge
  __gitfish_create_abbr gmt        git mergetool --no-prompt
  __gitfish_create_abbr gp         git push
  __gitfish_create_abbr gp!        git push --force-with-lease
  __gitfish_create_abbr gpo        git push origin
  __gitfish_create_abbr gpo!       git push --force-with-lease origin
  __gitfish_create_abbr gpv        git push --no-verify
  __gitfish_create_abbr gpv!       git push --no-verify --force-with-lease
  __gitfish_create_abbr ggp!       ggp --force-with-lease
  __gitfish_create_abbr gpu        ggp --set-upstream
  __gitfish_create_abbr gr         git remote -vv
  __gitfish_create_abbr gra        git remote add
  __gitfish_create_abbr grb        git rebase
  __gitfish_create_abbr grba       git rebase --abort
  __gitfish_create_abbr grbc       git rebase --continue
  __gitfish_create_abbr grbi       git rebase --interactive
  __gitfish_create_abbr grbm       git rebase master
  __gitfish_create_abbr grbmi      git rebase master --interactive
  __gitfish_create_abbr grbmia     git rebase master --interactive --autosquash
  __gitfish_create_abbr grbd       git rebase develop
  __gitfish_create_abbr grbdi      git rebase master --interactive
  __gitfish_create_abbr grbdia     git rebase master --interactive --autosquash
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
  __gitfish_create_abbr grup       git remote update
  __gitfish_create_abbr grv        git remote -v
  __gitfish_create_abbr gsh        git show
  __gitfish_create_abbr gsd        git svn dcommit
  __gitfish_create_abbr gsr        git svn rebase
  __gitfish_create_abbr gss        git status -s
  __gitfish_create_abbr gst        git status
  __gitfish_create_abbr gsta       git stash
  __gitfish_create_abbr gstd       git stash drop
  __gitfish_create_abbr gstp       git stash pop
  __gitfish_create_abbr gsts       git stash show --text
  __gitfish_create_abbr gsu        git submodule update
  __gitfish_create_abbr gsur       git submodule update --recursive
  __gitfish_create_abbr gsuri      git submodule update --recursive --init
  __gitfish_create_abbr gts        git tag -s
  __gitfish_create_abbr gtv        git tag | sort -V
  __gitfish_create_abbr gsw        git switch
  __gitfish_create_abbr gswc       git switch --create
  __gitfish_create_abbr gunignore  git update-index --no-assume-unchanged
  __gitfish_create_abbr gup        git pull --rebase
  __gitfish_create_abbr gwch       git whatchanged -p --abbrev-commit --pretty=medium

  # git checkout abbreviations
  __gitfish_create_abbr gco        git checkout
  __gitfish_create_abbr gcb        git checkout -b
  __gitfish_create_abbr gcod       git checkout develop
  __gitfish_create_abbr gcom       git checkout master

  # git flow abbreviations
  __gitfish_create_abbr gfb        git flow bugfix
  __gitfish_create_abbr gff        git flow feature
  __gitfish_create_abbr gfr        git flow release
  __gitfish_create_abbr gfh        git flow hotfix
  __gitfish_create_abbr gfs        git flow support

  __gitfish_create_abbr gfbs       git flow bugfix start
  __gitfish_create_abbr gffs       git flow feature start
  __gitfish_create_abbr gfrs       git flow release start
  __gitfish_create_abbr gfhs       git flow hotfix start
  __gitfish_create_abbr gfss       git flow support start

  __gitfish_create_abbr gfbt       git flow bugfix track
  __gitfish_create_abbr gfft       git flow feature track
  __gitfish_create_abbr gfrt       git flow release track
  __gitfish_create_abbr gfht       git flow hotfix track
  __gitfish_create_abbr gfst       git flow support track

  __gitfish_create_abbr gfp        git flow publish

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
