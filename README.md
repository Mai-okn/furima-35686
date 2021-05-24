# README

## Usersテーブル

|Column          |Type    |Options                   |
|----------------|--------|--------------------------|
| nickname       | string | null: false              |
| password       | string | null: false              |
| email          | string | null: false, unique: true|
| last-name      | string | null: false              |
|first-name      | string | null: false              |
|last-name-kana  | string | null: false              |
|first-name-kana | string | null: false              |
|birthday        | integer| null: false              |

### Association

- has_many :items
- has_many :trades
- has_many :addresses


## Itemsテーブル

|Column          |Type        |Options                   |
|----------------|------------|--------------------------|
|name            | string     | null: false              |
|description     | text       | null: false              |
|category        | string     | null: false              |
|image           | text       | null: false              |
|price           | integer    | null: false              |
|status          | string     | null: false              |
|delivery charge | string     | null: false              |
|delivery days   | string     | null: false              |
|shipping area   | string     | null: false              |
|seller_id       | references | foreign_key: true        |

### Association

- belongs_to :user
- has_one :trade


## Tradesテーブル

|Column        |Type        |Options                   |
|--------------|------------|--------------------------|
|customer_id   | references | foreign_key: true        |
|seller_id     | references | foreign_key: true        |
|items_id      | references | foreign_key: true        |

### Association

- belongs_to :item
- belongs_to :address


## Addressesテーブル

|Column        |Type        |Options                   |
|--------------|------------|--------------------------|
|phone_number  | integer    | null: false              |
|postal_code   | integer    | null: false              |
|prefecture    | string     | null: false              |
|city          | string     | null: false              |
|address       | string     | null: false              |
|building      | string     | null: false              |
|user_id       | references | foreign_key: true        |

### Association

- belongs_to :user
- has_one :trade