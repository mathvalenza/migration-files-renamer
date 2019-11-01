i=1
for FILE in *.sql; do
  NEW_SEQUENCE_NAME=$(printf "V%06d" "$i")
  FILE_NAME=${FILE##*__}
  NEW_FILE_NAME=$(printf "%s__%s" "$NEW_SEQUENCE_NAME" "$FILE_NAME")

  if [ $FILE != $NEW_FILE_NAME ]; then
    mv -i -- "$FILE" "$NEW_FILE_NAME"
  fi

  let i=i+1
done
