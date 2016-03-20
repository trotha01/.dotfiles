# COLORS
RESET_COLOR='\033[0m'
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'

function we_are_on_repo() {
  if [[ -e "$(git rev-parse --git-dir 2> /dev/null)" ]]; then
    echo 1
  fi
  echo 0
}

function branch() {
  echo $(git branch -q)
}

# Returns branch plus 3 ints: indexed modified untracked
function status() {

  # unindexed changes
  unindexedModify=0
  unindexedDelete=0
  untracked=0

  # indexed changes
  modified=0
  added=0
  deleted=0
  renamed=0

  # updatedButUnmerged=0 #TODO: understand this one

  # To understand the XY status codes see:
  # https://git-scm.com/docs/git-status

  BRANCH=""

  while IFS= read -r s; do
    if [ -z $BRANCH ]; then
      s=($s)
      BRANCH="${s[1]}"
      continue
    fi

    X=${s:0:1}
    Y=${s:1:1}

    case $X in
    [M])
      modified=$((modified+1)) ;;
    [A])
      added=$((added+1)) ;;
    [D])
      deleted=$((deleted+1)) ;;
    [R])
      renamed=$((renamed+1)) ;;
    [C])
      copied=$((copied+1)) ;;
    # [U])
    #   updatedButUnmerged=$((updatedButUnmerged+1)) ;;
    "?")
      untracked=$((untracked+1)) ;;
    esac

    case $Y in
    [M])
      unindexedModify=$((unindexedModify+1)) ;;
    [D])
      unindexedDelete=$((unindexedDelete+1)) ;;
    esac
  done < <(git status --porcelain -b)

  # echo "modified: $modified"
  # echo "unindexedModify: $unindexedModify"
  # echo "added: $added"
  # echo "deleted: $deleted"
  # echo "renamed: $renamed"
  # echo "updatedButUnmerged: $updatedButUnmerged"
  # echo "untracked: $untracked"

  indexed=$((modified + added + deleted + renamed))
  # echo "indexed: $indexed"
  # echo "untracked: $untracked"
  # echo "unindexed: $unindexedModify"
  echo "$BRANCH $indexed $unindexedModify $untracked"
}

function prompt_status() {
  # To get the hex, you can use:
  # echo -n ●|hexdump
  PLUS="\xE2\x9C\x9A" # ✚
  ELLIPSIS="\xE2\x80\xA6" # …
  DOT="\xE2\x97\x8F" # ●
  CHECK="\xE2\x9C\x94" # ✔

  IFS=" " read -r -a array < <(status)
  branch=${array[0]}
  indexed=${array[1]}
  unindexedModified=${array[2]}
  untracked=${array[3]}

  if [ $branch = "HEAD" ]; then
    branch=`git rev-parse --verify -q --short HEAD`
  fi


  prompt="[$branch|"
  if [ $indexed -gt 0 ]; then
    prompt="$prompt$RED$DOT $indexed$RESET_COLOR"
  fi
  if [ $unindexedModified -gt 0 ]; then
    prompt="$prompt$BLUE$PLUS $unindexedModified$RESET_COLOR"
  fi
  if [ $untracked -gt 0 ]; then
    prompt="$prompt$ELLIPSIS $untracked"
  fi
  if [ $indexed -eq 0 ] && [ $unindexedModified -eq 0 ] && [ $untracked -eq 0 ]; then
    prompt="$prompt$GREEN$CHECK$RESET_COLOR"
  fi

  echo -e "$prompt]"
}
