# テーブル設計


## users table
| Column             | Type    | Options                        |
|--------------------|---------|--------------------------------|
| nickname           | string  | null: false                    |
| email              | string  | null: false                    |
| encrypted_password | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name          | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| birth_day          | date    | null: false                    |

### Association
- has_many :items
- has_one :address





## items table（商品情報）

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| brand              | references | null: false  foreign_key: true |
| category           | references | null: false  foreign_key: true |
| price              | integer    | null: false                    |
| name               | string     | null: false                    |
| item_text          | text       | null: false                    |
| shipping_cost      | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_days      | string     | null: false                    |

### Association

- belongs_to :user
- has_one :orders




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

- belongs_to :user



## orders テーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address