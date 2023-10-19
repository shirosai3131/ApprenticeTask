# パスワードマネージャー ステップ2

# 選択肢を変数に格納
addPass="Add Password"
getPass="Get Password"
exit="Exit"

echo "パスワードマネージャーへようこそ！"

while true;
do
  read -p "次の選択肢から入力してください($addPass/$getPass/$exit)：" action
  
  case $action in
    # Add Password が入力された場合
    $addPass)
      echo -n "サービス名を入力してください："
      read saviceName

      echo -n "ユーザー名を入力してください："
      read userName

      echo -n "パスワードを入力してください："
      read passWord

      # 入力された情報をpassword.txtに追記する。(動作テスト毎に追記されるので一旦コメントアウト)
      # echo $saviceName:$userName:$passWord >> password.txt
      echo "パスワードの追加は成功しました。"
      ;;

    # Get Password が入力された場合
    $getPass)
      read -p "サービス名を入力してください：" serchSaviceName
      # $serchSaviceNameに入力された文字列をpassword.txt内で検索し、
      # 対応するユーザー名とパスワードを取得
      getServiceName=$(grep "$seachSaviceName" password.txt | cut -f 1 -d ":")
      getUserName=$(grep "$seachSaviceName" password.txt | cut -f 2 -d ":")
      getPassWord=$(grep "$seachSaviceName" password.txt | cut -f 3 -d ":")
      echo "サービス名：$getServiceName"
      echo "ユーザー名：$getUserName"
      echo "パスワード：$getPassWord"
      exit
      ;;
    
    #Exit が入力された場合
    $exit)
      echo "Thank you!"
      #whileループを抜ける(プログラムが終了)
      exit
      ;;

    # Add Password/Get Password/Exit 以外が入力された場合
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done