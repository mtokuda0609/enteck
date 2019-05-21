class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :company, foreign_key: true
      t.references :friend, foreign_key: { to_table: :companies }

      t.timestamps
      
      t.index [:company_id, :friend_id], unique: true
    end
  end
end
