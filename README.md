# テーブル設計

## usersテーブル

｜     Column    | Type |      Options       |
｜---------------|------|--------------------|
｜nickname       |string| null: false        |
｜email          |string| null: false, unique: true        |
|encrypted_password |string| null: false        |
|first_name      |string| null: false        |
|last_name       |string| null: false        |
|first_name_kana |string| null: false        |
|last_name_kana  |string| null: false        |
|birthday        | date | null: false        |

### Association

- has_many :items
- has_many :purchases_admins

## itemsテーブル

|        Column         | Type   |     Option     |
|-----------------------|--------|----------------|
| name             | string | null: false    |
| info             | text   | null: false    |
| category_id           | integer | null: false    |
| appearance_id            | integer  | null: false    |
| delivery_style_id        | integer | null: false    |
| delivery_local_id        | integer  | null: false    |
| delivery_date_id         | integer  | null: false    |
| price            | integer | null: false    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_admin

## purchasesテーブル

|       Column      |     Type    |                 Option                |
|-------------------|-------------|---------------------------------------|
|post_number        | string      | null: false                           |
|delivery_local_id      | integer     | null: false                           |
|local_position_town| string      | null: false                           |
|local_address      | string      | null: false                           |
|building_name      | string      |                                       |
|phone_number       | string      | null: false                           |
| purchase_admin        | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_admin

## purchase_admins

|   Column        |    Type       |            Option            |
|-----------------|---------------|------------------------------|
|user             |references     |  null: false, foreign_key: true |
|item             |references     |  null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase

