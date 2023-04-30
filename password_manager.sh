#!/bin/bash

echo 'パスワードマネージャーへようこそ！'
echo '次の選択肢から入力してください(Add Password/Get Password/Exit): '

PASSWORD_FILE="password.txt"
extension=".gpg"
ENCRYPTED_PASSWORD_FILE+="${PASSWORD_FILE}${extension}"
gpg_pass=$(cat gpg_password)

while :
do
  read user_answer
  case "$user_answer" in
    "Add Password")
      read -p 'サービス名を入力してください： ' service_name
      read -p 'ユーザー名を入力してください： ' user_name
      read -p 'パスワードを入力してください： ' password
      echo "$gpg_pass" | gpg --passphrase="$gpg_pass" --batch --yes --quiet -o "$PASSWORD_FILE" -d "$ENCRYPTED_PASSWORD_FILE"
      echo $service_name:$user_name:$password >> "$PASSWORD_FILE"
      echo 'パスワードの追加に成功しました。'
      echo "$gpg_pass" | gpg --passphrase="$gpg_pass" --batch --yes -c "$PASSWORD_FILE"
      rm "$PASSWORD_FILE"
      echo '次の選択肢から入力してください(Add Password/Get Password/Exit): '
      ;;
    "Get Password")
      read -p 'サービス名を入力してください： ' service_name
      echo "$gpg_pass" | gpg --passphrase="$gpg_pass" --batch --yes --quiet -o "$PASSWORD_FILE" -d "$ENCRYPTED_PASSWORD_FILE"
      register_service=0
      while read line
      do
        col1=$(echo ${line} | cut -d ':' -f 1)
        if [[ "$col1" == "$service_name" ]] ; then
          col2=$(echo ${line} | cut -d ':' -f 2)
          col3=$(echo ${line} | cut -d ':' -f 3)
          echo "サービス名: $col1"
          echo "ユーザー名: $col2"
          echo "パスワード: $col3"
          register_service=1
          break
        fi
      done < $PASSWORD_FILE

      if [[ $register_service -eq 0 ]] ; then
          echo "そのサービスは登録されていません。"
      fi
      echo "$gpg_pass" | gpg --passphrase="$gpg_pass" --batch --yes -c "$PASSWORD_FILE"
      rm "$PASSWORD_FILE"
      echo '次の選択肢から入力してください(Add Password/Get Password/Exit): '
      ;;
    "Exit")
      echo 'Thank you!'
      break
      ;;
    *)
      echo '入力が間違っています。Add Password/Get Password/Exit から入力してください。'
  esac
done
