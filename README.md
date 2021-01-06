# Userテーブル
| Column         | Type    | Option      |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| last_name      | string  | null: false |
| first_name     | string  | null: false |
| last_furigana  | string  | null: false |
| first_furigana | string  | null: false |
| birthday       | integer | null: false |

## アソシエーション
- has_many :items
- has_many :orders

# Itemテーブル
| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

## アソシエーション
- belongs_to :user
- has_one :order

# Orderテーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| card_num      | integer    | null: false                    |
| card_limit    | integer    | null: false                    |
| security_code | integer    | null: false                    |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     | null: true                     |
| phone         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

## アソシエーション
- belongs_to :user
- belongs_to :item
