#テーブル設計

#usersテーブル
| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |   
| goal               | string | null: false               |
| to_do              | string | null: false               |


### Association
- has_many :points
- has_many :posts
- has_many :community_users
- has_many :communities, through: :community_users


#postsテーブル
| Column              | Type       | Option                         |
| ----------------    | ---------- |------------------------------- |
| to_do                | string     | null: false                    |  
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :community
- has_many :comments
- has_one :point



#communitiessテーブル
| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| diet           | string     | null: false                    |  
| training          | string     | null: false                    |  
| study           | string     | null: false                    |  

### Association
- has_many :users, through: :community_users
- has_many :community_users
- has_many :posts


#community_usersテーブル
| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| community            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :community


#pointsテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| comment            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :comment
- belongs_to :post

#commentsテーブル
| Column              | Type       | Option                         |
| ----------------    | ---------- |------------------------------- |
| content                | string     | null: false                    |  

### Association
- belongs_to :post
- belongs_to :point