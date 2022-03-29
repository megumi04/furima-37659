# テーブル設計


## users table
| Column             | Type    | Options                        |
|--------------------|---------|--------------------------------|
| nickname           | string  | null: false                    |
| email              | string  | null: false, unique: true      |
| encrypted_password | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name          | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| birth_day          | date    | null: false                    |

### Association
- has_many :items
- has_many :orders





## items table（商品情報）

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| price              | integer    | null: false                    
| item_text          | text       | null: false                    |
| brand_id           | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

- belongs_to_active_hash :brand_id
- belongs_to_active_hash :category_id
- belongs_to_active_hash :shipping_cost_id
- belongs_to_active_hash :state_id 
- belongs_to_active_hash :shipping_day_id






##  addresses table（配送先）

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| zip_code        | string     | null: false                    |
| state_id        | integer    | null: false                    |
| city            | string     | null: false                    |
| street_number   | string     | null: false                    |
| apartment       | string     |                                |
| phone           | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

- belongs_to_active_hash :state_id 




## orders テーブル(注文)

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
