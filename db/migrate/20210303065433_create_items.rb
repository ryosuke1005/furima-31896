class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              null: false
      t.string :name,                 null: false
      t.text :explain,                null: false
      t.integer :category_id,         null: false
      t.integer :prefecture_id,       null: false
      t.integer :price,               null: false
      t.integer :postage_id,          null: false
      t.integer :shipping_date_id,    null: false
      t.integer :status_id,           null: false
      t.timestamps
    end
  end
end
