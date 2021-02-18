## usersテーブル

| Column              | Type         | Options                  |
| ---------------     | ------------ | ------------------------ |
| email               | string       | null:false, unique:true  |
| nickname            | string       | null:false              |
| encrypted_password  | string       | null:false              |
| birthday            | date         | null:false              |
| first_name          | string       | null:false              |
| last_name           | string       | null:false              |
| first_name_kana     | string       | null:false              |
| last_name_kana      | string       | null:false              |

### Association
- has_many :products
- has_many :purchase_histories


## productsテーブル

| Column           | Type         | Options                       |
| ----------------- | ------------ | ------------------------------ |
| user             | reference    | null:false, foreign_key: true  |
| name             | string       | null:false                    |
| explain          | text         | null:false                    |
| category_id      | integer      | null:false                    |
| prefecture_id    | integer      | null:false                    |
| price            | integer      | null:false                    |
| postage_id       | integer      | null:false                    |
| shipping_date_id | integer      | null:false                    |
| status_id        | integer      | null:false                    |

### Association

- belongs_to :user
- has_one :purchase_history


## shipping_addressテーブル

| Column            | Type         | Options                       |
| ----------------- | ------------ | ----------------------------- |
| postal_code       | string       | null:false                    |
| prefecture_id     | integer      | null:false                    |
| city              | string       | null:false                    |
| building_name     | string       |                               |
| address           | string       | null:false                    |
| phone_number      | string       | null:false                    |
| purchase_history  | reference    | null:false, foreign_key: true |

### Association

- belongs_to :purchase_history

## purchase_history

| Column          | Type         | Options                       |
| --------------- | ------------ | ----------------------------- |
| user            | reference    | null:false, foreign_key: true |
| product         | reference    | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping_address