# パスワードマネージャー

シェルスクリプト学習用のパスワードを管理するパスワードマネージャーです。
あくまで個人学習用であり、実際に使用されることを想定したものではありませんので、ご留意ください。

## インストール法、始め方
ターミナル上で次のコマンドを実行してください。

```bash
git clone https://github.com/masa-kogi/password_manager.git
cd password_manager
./password_manager.sh
```
## 使い方のサマリー
シェルスクリプトを実行すると、以下のメニューが表示されます。

```bash
パスワードマネージャーへようこそ！
次の選択肢から入力してください(Add Password/Get Password/Exit)：
```

Add Password が入力されると、サービス名、ユーザー名、パスワードの入力が求められ、入力された情報をファイルに保存して暗号化します。
Get Password が入力されると、サービス名の入力が求められ、入力されたサービスのサービス名、ユーザー名、パスワードが表示されます。
Exit が入力されると、プログラムが終了します。
Exit が入力されるまではプログラムは終了せず、「次の選択肢から入力してください(Add Password/Get Password/Exit)：」が繰り返されます。

▼アウトプット

```bash
パスワードマネージャーへようこそ！
次の選択肢から入力してください(Add Password/Get Password/Exit)：

# Add Password が入力された場合
サービス名を入力してください：
ユーザー名を入力してください：
パスワードを入力してください：

パスワードの追加に成功しました。
次の選択肢から入力してください(Add Password/Get Password/Exit)：

# Get Password が入力された場合
サービス名を入力してください：
## サービス名が保存されていなかった場合
そのサービスは登録されていません。
## サービス名が保存されていた場合
サービス名：hoge
ユーザー名：fuga
パスワード：piyo

次の選択肢から入力してください(Add Password/Get Password/Exit)：

# Exit が入力された場合
Thank you!
## プログラムが終了

# Add Password/Get Password/Exit 以外が入力された場合
入力が間違っています。Add Password/Get Password/Exit から入力してください。
```

## 文責
- 小木曽 将弘
