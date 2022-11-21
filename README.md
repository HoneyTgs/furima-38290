# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| last_name          | string | null: false             |
| first_name         | string | null: false             |
| last_name_kana     | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | data   | null: false             |

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| user                  | references | null: false foreign_key: true |
| name                  | string     | null: false                   |
| description           | text       | null: false                   |
| category_id           | integer    | null: false                   |
| item_status_id        | integer    | null: false                   |
| shopping_cost_id      | integer    | null: false                   |
| prefecture_id         | integer    | null: false                   |
| shopping_date_id      | integer    | null: false                   |
| price                 | integer    | null: false                   |
 
- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| --- -- | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| order          | references  | null: false, foreign_key: true |
| postcode       | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| city           | string      | null: false                    |
| block          | string      | null: false                    |
| building       | string      |                                |
| phone_number   | string      | null: false                    |

- belongs_to :order

