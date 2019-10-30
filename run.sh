a=1
for i in *.sql; do
  NEW_SEQUENCE_NAME=$(printf "V%06d" "$a") #04 pad to length of 4
  FILE_NAME=${i##*__}  # retain the part after the last slash
  NEW_FILE_NAME=$(printf "%s__%s" "$NEW_SEQUENCE_NAME" "$FILE_NAME")

  mv -i -- "$i" "$NEW_FILE_NAME"

  let a=a+1
done
