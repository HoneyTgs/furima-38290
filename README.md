# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

- has_many :items
- has_many :comments

## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| content   | string |             |

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| content   | string     |                                |

- belongs_to :user
- belongs_to :item
