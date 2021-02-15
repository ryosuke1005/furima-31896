## usersテーブル

| Column          | Type         | Options           |
| --------------- | ------------ | ----------------- |
| email           | string       | null:false        |
| nickname        | string       | null:false        |
| password        | string       | null:false        |
| birthday        | date         | null:false        |
| first_name      | string       | null:false        |
| last_name       | string       | null:false        |
| first_name_kana | string       | null:false        |
| last_name_kana  | string       | null:false        |

### Association
- has_many :products
- belongs_to :purchase


## productsテーブル

| Column          | Type         | Options           |
| --------------- | ------------ | ----------------- |
| user            | reference    | index:true        |
| image           | text         | null:false        |
| name            | string       | null:false        |
| explain         | text         | null:false        |
| category        | string       | null:false        |
| prefecture      | string       | null:false        |
| price           | integer      | null:false        |
| postage         | integer      | null:false        |
| shipping_date   | string       | null:false        |
| status          | string       | null:false        |

### Association

- belongs_to :users
- belongs_to :purchase


## purchaseテーブル

| Column          | Type         | Options           |
| --------------- | ------------ | ----------------- |
| user            | reference    | index:true        |
| name            | string       | null:false        |
| credit_cards    | integer      | null:false        |
| address         | string       | null:false        |
| prefecture      | string       | null:false        |
| city            | string       | null:false        |
| phone_number    | integer      | null:false        |

### Association

- belongs_to :users
- belongs_to :products
