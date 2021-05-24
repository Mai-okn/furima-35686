# README

## Usersテーブル

|Column             |Type    |Options                   |
|-------------------|--------|--------------------------|
|nickname           | string | null: false              |
|encrypted_password | string | null: false              |
|email              | string | null: false, unique: true|
|last_name          | string | null: false              |
|first_name         | string | null: false              |
|last_name_kana     | string | null: false              |
|first_name_kana    | string | null: false              |
|birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :trades



## Itemsテーブル

|Column             |Type        |Options                   |
|-------------------|------------|--------------------------|
|name               | string     | null: false              |
|description        | text       | null: false              |
|price              | integer    | null: false              |
|category_id        | integer    | null: false              |
|status_id          | integer    | null: false              |
|delivery_charge_id | integer    | null: false              |
|delivery_days_id   | integer    | null: false              |
|prefecture_id      | integer    | null: false              |
|user               | references | foreign_key: true        |

### Association

- belongs_to :user
- has_one :trade


## Tradesテーブル

|Column        |Type        |Options                   |
|--------------|------------|--------------------------|
|user          | references | foreign_key: true        |
|item          | references | foreign_key: true        |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user


## Addressesテーブル

|Column        |Type        |Options                   |
|--------------|------------|--------------------------|
|phone_number  | integer    | null: false              |
|postal_code   | integer    | null: false              |
|prefecture_id | integer    | null: false              |
|city          | integer    | null: false              |
|address       | integer    | null: false              |
|building      | integer    |                          |
|trade         | references | foreign_key: true        |

### Association

- belongs_to :trade