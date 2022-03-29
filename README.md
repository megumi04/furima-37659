# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




# テーブル設計


## users table
| Column             | Type    | Options                        |
|--------------------|---------|--------------------------------|
| nickname           | string  | null: false                    |
| email              | string  | null: false                    |
| encrypted_password | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name          | string  | null: false                    |
| birth_day          | text    | null: false                    |

### Association
- has_many :items
- belongs_to :destination





## items table（商品情報）

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user_id            | integer    | null: false, foreign_key: true |
| brand_id           | string     | null: false                    |
| category_id        | string     | null: false                    |
| price              | string     | null: false                    |
| name               | string     | null: false                    |
| product_status     | string     | null: false                    |
| shipping_cost      | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_days      | string     | null: false                    |

### Association

- belongs_to :user 
- belongs_to :category 
- belongs_to :brand
- has_many :images




##  destination table（購入者）

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user_id      | integer    | null: false, foreign_key: true |
| zip_code     | string     | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| street_number| string     | null: false                    |
| apartment    | string     | null: false                    |
| phone        | integer     | null: false                   |

### Association

- has_many :user




## images

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| image        | string     | null: false                    |
| item_id      | integer   | null: false, foreign_key: true  |

### Association
- belongs_to :item



## brand

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| name         | string     | null: false                    |

### Association
- has_many :item



## category

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
|name          | string     | null: false                    |

### Association
- has_many :item
