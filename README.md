# アプリケーション名
モクタツ

# アプリケーション概要
共通の達成したい目標があるユーザー同士でコミュニティーを作り、日々の取り組みなどを発信しあうアプリケーション

# URL
https://mokutatu2.herokuapp.com/

# 目指した課題解決
「達成したい目標はあるが、一人では努力が継続できずに挫折してしまった人」の「挫折してしまって目標が達成できず、成功体験が積めない問題」をアプリケーションで解決することを目指しました。

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

## 投稿詳細ページ
* 投稿に対するコメントの閲覧や削除ができます

## マイページ
* そのユーザーのプロフィールや投稿一覧が閲覧できます
* ログイン中のユーザーのみ、プロフィールの編集画面に遷移するボタンが表示されます。
 
# 洗い出した要件

# データベース設計
<img width="692" alt="スクリーンショット 2022-03-29 14 18 41" src="https://user-images.githubusercontent.com/97263370/160538949-6fce222d-b121-4dad-b603-f12fe80d3566.png">


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

### Association
- belongs_to :user
- belongs_to :community
- has_many :comments, dependent: :destroy


## communitiessテーブル
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
