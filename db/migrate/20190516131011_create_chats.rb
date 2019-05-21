class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :company, foreign_key: true
      t.references :relationship, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
