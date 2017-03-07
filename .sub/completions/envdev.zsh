if [[ ! -o interactive ]]; then
    return
fi

compctl -K _envdev envdev

_envdev() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(envdev commands)"
  else
    completions="$(envdev completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
