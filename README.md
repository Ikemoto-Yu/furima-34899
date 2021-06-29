#　テーブル設計

## userテーブル

｜     Column    | Type |      Options       |
｜---------------|------|--------------------|
｜nickname       |string| null: false        |
｜email          |string| null: false, unique: true        |
|encrypted_password |string| null: false        |
|first_name      |string| null: false        |
|last_name       |string| null: false        |
|first_name_kana |string| null: false        |
|last_name_kana  |string| null: false        |
|birthday_year_id   |integer| null: false       |
|birthday_month_id  |integer| null: false       |
|birthday_date_id   |integer| null: false       |


### Association

- has_many :items
- has_many :purchases

## itemテーブル

|        Column         | Type   |     Option     |
|-----------------------|--------|----------------|
| item_name             | string | null: false    |
| item_text             | text   | null: false    |
| category_id           | integer | null: false    |
| appearance_id            | integer  | null: false    |
| delivery_style_id        | integer | null: false    |
| delivery_local_id        | integer  | null: false    |
| delivery_date_id         | integer  | null: false    |
| item_price            | integer | null: false    |
| user_id               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## commentテーブル

|      Column       |      Type     |          Option         |
|-------------------|---------------|-------------------------|
| text              | text          | null: false             |
| user_id           | references    | null: false, foreign_key: true|
| item_id           | references    | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## purchaseテーブル

|       Column      |     Type    |                 Option                |
|-------------------|-------------|---------------------------------------|
|post_number        | string      | null: false                           |
|delivery_local_id      | integer     | null: false                           |
|local_position_town| string      | null: false                           |
|local_address      | string      | null: false                           |
|building_name      | string      |                                       |
|phone_number       | string      | null: false                           |


### Association

- belongs_to :user
- belongs_to :item

## purchase_admin

|   Column        |    Type       |            Option            |
|-----------------|---------------|------------------------------|
|user_id          |references     |  null: false, foreign_key: true |
|item_id          |references     |  null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

