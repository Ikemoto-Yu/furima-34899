class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :name, null: false
      t.text         :info, null: false
      t.integer      :category_id, null: false
      t.integer      :appearance_id, null: false
      t.integer      :delivery_style_id, null: false
      t.integer      :delivery_local_id, null: false
      t.integer      :delivery_date_id, null: false
      t.integer      :price, null: false
      t.references   :user , null: false ,foreign_key: true

      t.timestamps
    end
  end
end
