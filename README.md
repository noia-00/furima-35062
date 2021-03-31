# テーブル設計

## users テーブル

| Column            | Type       | Options                   |
| ----------------- | -----------| ------------------------- |
| nickname          | string     | null: false               |
| email             | string     | null: false, unique: true |
| password          | string     | null: false               |
| lastname          | string     | null: false               |
| firstname         | string     | null: false               |
| lastname_kana     | string     | null: false               |
| firstname_kana    | string     | null: false               |
| birthday          | date       | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                   |
| ----------------- | -----------| ------------------------- |
| name              | string     | null: false               |
| info              | string     | null: false               |
| category          | integer    | null: false               |
| status            | integer    | null: false               |
| shipping_fee      | integer    | null: false               |
| shipping_place    | integer    | null: false               |
| delivery_schedule | integer    | null: false               |
| price             | integer    | null: false               |
| user              | references | foreign_key: true         |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options                   |
| ----------------- | ---------- | ------------------------- |
| user              | references | foreign_key: true         |
| item              | references | foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column            | Type       | Options                   |
| ----------------- | -----------| ------------------------- |
| postal_code       | string     | null: false               |
| prefecture        | integer    | null: false               |
| city              | string     | null: false               |
| address_line_1    | string     | null: false               |
| address_line_2    | string     |                           |
| phone_number      | integer    | null: false               |
| purchase          | references | foreign_key: true         |

### Association

- belongs_to :purchase
