# アプリケーション名
モクタツ

# アプリケーション概要
共通の達成したい目標があるユーザー同士でコミュニティーを作り、日々の取り組みなどを発信しあうアプリケーション

# URL
https://mokutatu2.herokuapp.com/

# 目指した課題解決
「達成したい目標はあるが、一人では努力が継続できずに挫折してしまった人」の「挫折してしまって目標が達成できず、成功体験が積めない問題」をアプリケーションで解決することを目指しました。  
問題解決にあたり、ペルソナが目標を達成する前に挫折してしまう要因と、その要因をアプリケーションでどのように解決していくかを考えました。  
下記に、その内容を記します。

要因①「目標達成への具体的な行動計画がない」
<br>
（解決策）目標設定時に「達成するために取り組むこと」も入力してもらい、コミュニティにログインしたらそれを見えるようにして、具体的な行動を可視化する。
<br>
要因②「目標達成に近づいているかが判断できない」　
<br>
（解決策）ユーザーに、目標の過程で達成する「中間目標」を設定してもらうことで、目標達成への進捗をわかりやすくする。
<br>
要因③「一人だと自分に負けて続かない」
<br>
（解決策）　共通の目標を持ったユーザーのコミュニティを作って、一人ではない体験をしてもらう。  


# テスト用アカウント
* Basic認証ユーザー名:admin
* Basic認証パスワード:2222
* 投稿者①メールアドレス:test@com1,パスワード：test1111
* 投稿者②メールアドレス:test@com2,パスワード：test2222

# 利用方法

## コミュニティ選択ページ
* ユーザーの新規登録・ログイン画面への遷移ができます
* 投稿・閲覧したいコミュニティの選択ができます

## コミュニティページ
* コミュニティ内の投稿の閲覧ができます
* 投稿者本人のみ、投稿の削除ができます
* 現在ログイン中のユーザーのプロフィールが閲覧できます。
* アイコンをクリックすると、そのユーザーのマイページに遷移します
* 「今日の取り組みを投稿する」をクリックすると、新規投稿ページに遷移します

## 新規投稿ページ
* コミュニティ内に新規投稿ができます

## 投稿詳細ページ
* 投稿に対するコメントの閲覧や投稿、削除ができます

## マイページ
* そのユーザーのプロフィールや投稿一覧が閲覧できます
* ログイン中のユーザーのみ、プロフィールの編集画面に遷移するボタンが表示されます。
 
# 洗い出した要件
* ユーザー管理機能
* コミュニティ選択機能
* 新規投稿機能
* 投稿一覧表示機能
* コメント機能
* マイページ編集機能
* 投稿削除機能

# 実装予定の機能
* 投稿に対する「いいね機能」
* 投稿やコメント数に応じて加算される「ポイント機能」
* 一定数ポイントが貯まると、レベルアップする機能

# データベース設計
<img width="691" alt="スクリーンショット 2022-03-29 17 38 12" src="https://user-images.githubusercontent.com/97263370/160570250-c99ad664-4d86-4b82-9a49-fa8d916b9792.png">



# テーブル設計

## usersテーブル
| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |   
| goal               | string | null: false               |
| second_goal        | string | null: false               |
| to_do              | string | null: false               |


### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :community, optional: true
- has_one_attached :image


## postsテーブル
| Column              | Type       | Option                         |
| ----------------    | ---------- |------------------------------- |
| text                | string     | null: false                    |  
| user                | references | null: false, foreign_key: true |
| community           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :community
- has_many :comments, dependent: :destroy


## communitiesテーブル
| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |  


### Association
- has_many :users
- has_many :posts


## commentsテーブル
| Column              | Type       | Option                         |
| ----------------    | ---------- |------------------------------- |
| text                | string     | null: false                    |  
| user                | references | null: false, foreign_key: true |
| post                | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user
