# パスワードマネージャー ステップ1

echo "パスワードマネージャーへようこそ！"
echo -n "サービス名を入力してください："
read saviceName

echo -n "ユーザー名を入力してください："
read userName

echo -n "パスワードを入力してください："
read passWord

echo $saviceName:$userName:$passWord >> password.txt

# 入力が完了したら
echo "Thank you!"