class CreatePurchaseAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_admins do |t|
      t.references    :item,     null: false, foreign_key: true
      t.references    :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
