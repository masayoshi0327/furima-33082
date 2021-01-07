# Userテーブル
| Column         | Type   | Option      |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_furigana  | string | null: false |
| first_furigana | string | null: false |
| birthday       | date   | null: false |

## アソシエーション
- has_many :items
- has_many :orders

# Itemテーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| sender        | integer    | null: false                    |
| delivery_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

## アソシエーション
- belongs_to :user
- has_one :order

# Orderテーブル
| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

## アソシエーション
- belongs_to :user
- belongs_to :item
