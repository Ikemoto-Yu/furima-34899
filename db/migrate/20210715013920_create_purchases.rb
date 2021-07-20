class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.string       :phone_number,          null: false
      t.string       :building_name
      t.string       :local_address,         null: false
      t.string       :local_position_town,   null: false
      t.integer      :delivery_local_id,     null: false
      t.string       :post_number,           null: false
      t.references   :purchase_admin,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
