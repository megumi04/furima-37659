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
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    
| item_text          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| shopping_cost_id   | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shopping_day_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

- belongs_to_active_hash :category
- belongs_to_active_hash :shopping_cost
- belongs_to_active_hash :state
- belongs_to_active_hash :sopping_day






##  addresses table（配送先）

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| state_id        | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| apartment       | string     |                                |
| phone           | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

- belongs_to_active_hash :state




## orders テーブル(注文)

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
