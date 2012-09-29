if [[ ! -o interactive ]]; then
    return
fi

compctl -K _armoury armoury

_armoury() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(armoury commands)"
  else
    completions="$(armoury completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
