class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :company, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity, :limit => 6
      t.integer :price, :limit => 6

      t.timestamps
    end
  end
end
