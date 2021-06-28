#　テーブル設計

## userテーブル

｜     Column    | Type |      Options       |
｜---------------|------|--------------------|
｜nickname       |string| null: false        |
｜email          |string| null: false        |
|password        |string| null: false        |
|first_name      |string| null: false        |
|last_name       |string| null: false        |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## itemテーブル

|        Column         | Type   |     Option     |
|-----------------------|--------|----------------|
| item_name             | string | null: false    |
| item_text             | text   | null: false    |
| image                 | string | null: false    |
| category              | string | null: false    |
| appearance            | string | null: false    |
| delivery_style        | string | null: false    |
| delivery_local        | string | null: false    |
| delivery_date         | string | null: false    |
| item_price            | string | null: false    |
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
|credit_number      | integer     | null: false                           |
|credit_limited_date| integer     | null: false                           |
|credit_security_code| integer    | null: false                           |
|post_number        | integer     | null: false                           |
|local_position     | integer     | null: false                           |
|local_position_town| string      | null: false                           |
|local_address      | string      | null: false                           |
|building_name      | string      |                                       |
|phone_number       | integer     | null: false                           |
|user_id            | references  | null: false, foreign_key: true        |
|item_id            | references  | null: false, foreign_key: true        |

### Association

- belongs_to :user
- belongs_to :item
