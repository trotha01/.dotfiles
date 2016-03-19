function we_are_on_repo() {
  if [[ -e "$(git rev-parse --git-dir 2> /dev/null)" ]]; then
    echo 1
  fi
  echo 0
}

function branch() {
  echo $(git branch -q)
}

# Returns 3 ints: indexed modified untracked
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

  while IFS= read -r s; do
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
  done < <(git status --porcelain)

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
  echo "$indexed $unindexedModify $untracked"
}

function prompt_status() {
  PLUS="\xE2\x9C\x9A" # ✚
  ELLIPSIS="\xE2\x80\xA6" # …
  DOT="\xE2\x97\x8F" # ●

  IFS=" " read -r -a array < <(status)
  indexed=${array[0]}
  unindexedModified=${array[1]}
  untracked=${array[2]}

  prompt=""
  if [ $indexed -gt 0 ]; then
    prompt="$prompt$DOT $indexed"
  fi
  if [ $unindexedModified -gt 0 ]; then
    prompt="$prompt$PLUS $unindexedModified"
  fi
  if [ $untracked -gt 0 ]; then
    prompt="$prompt$ELLIPSIS $untracked"
  fi

  echo -e "$prompt"
}
