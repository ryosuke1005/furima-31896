## usersテーブル

| Column              | Type         | Options           |
| ---------------     | ------------ | ----------------- |
| email               | string       | null:false        |
| nickname            | string       | null:false        |
| encrypted_password  | string       | null:false        |
| birthday            | date         | null:false        |
| first_name          | string       | null:false        |
| last_name           | string       | null:false        |
| first_name_kana     | string       | null:false        |
| last_name_kana      | string       | null:false        |

### Association
- has_many :products
- has_one :purchase_histories
- has_one :shipping_address


## productsテーブル

| Column          | Type         | Options           |
| --------------- | ------------ | ----------------- |
| user            | reference    | index:true        |
| name_id         | integer      | null:false        |
| explain_id      | text         | null:false        |
| category_id     | integer      | null:false        |
| prefecture_id   | integer      | null:false        |
| price           | integer      | null:false        |
| postage_id      | integer      | null:false        |
| shipping_date   | string       | null:false        |
| status          | string       | null:false        |

### Association

- belongs_to :user
- belongs_to :purchase_history


## shipping_addressテーブル

| Column            | Type         | Options                       |
| ----------------- | ------------ | ----------------------------- |
| postal_code       | string       | null:false                    |
| prefecture_id     | integer      | null:false                    |
| city              | string       | null:false                    |
| address_id        | integer      | null:false                    |
| phone_number      | string       | null:false                    |
| purchase_history  | reference    | null:false, foreign_key: true |

### Association

- belongs_to :user
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