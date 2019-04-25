class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :company, foreign_key: true
      t.string :explanation
      t.integer :price
      t.string :unit
      t.integer :minimum_lot
      t.binary :pics

      t.timestamps
    end
  end
end
