# パスワードマネージャー ステップ2

# 選択肢を変数に格納
addPass="Add Password"
getPass="Get Password"
exit="Exit"

echo "パスワードマネージャーへようこそ！"

while true; # exitのコマンドが実行されるまでループ
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

      # 入力された情報をpassword.txtに追記する。
      echo $saviceName:$userName:$passWord >> password.txt
      echo "パスワードの追加は成功しました。"
      ;;

    # Get Password が入力された場合
    $getPass)
      read -p "サービス名を入力してください：" searchSaviceName

      # $serchSaviceNameに入力された文字列をpassword.txt内で検索し、出力を変数に代入
      getServiceName=$(grep "^$searchSaviceName:" password.txt | cut -f 1 -d ":")
      
      # 変数内の文字列が空でない場合
      if [ -n "$getServiceName" ]; then
        # $serchSaviceNameに入力された文字列をpassword.txt内で検索し、
        # 対応するサービス名、ユーザー名、パスワードを取得し表示する。
        getUserName=$(grep "^$getSaviceName" password.txt | cut -f 2 -d ":")
        getPassWord=$(grep "^$getSaviceName" password.txt | cut -f 3 -d ":")
        echo "サービス名：$getServiceName"
        echo "ユーザー名：$getUserName"
        echo "パスワード：$getPassWord"
      # 変数内の文字列が空の場合(サービス名が保存されていなかった場合)
      else
        echo "そのサービスは登録されていません。"
      fi
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