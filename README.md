# テーブル設計


## users table
| Column             | Type    | Options                        |
|--------------------|---------|--------------------------------|
| nickname           | string  | null: false                    |
| email              | string  | null: false, foreign_key:true  |
| encrypted_password | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name          | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| birth_day          | date    | null: false                    |

### Association
- has_many :items
- has_one :order





## items table（商品情報）

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| brand              | references | null: false  foreign_key: true |
| category           | references | null: false  foreign_key: true |
| price              | integer    | null: false                    |
| item_text          | text       | null: false                    |
| name               | string     | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

- belongs_to_active_hash :shipping_cost_id
- belongs_to_active_hash :shipping_area_id
- belongs_to_active_hash :shipping_day_id





##  address table（配送先）

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| zip_code     | string     | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| street_number| string     | null: false                    |
| apartment    | string     |                                |
| phone        | string     | null: false                    |

### Association

- has_one :order



## orders テーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
