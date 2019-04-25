class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, :limit => 30
      t.string :email, :limit => 50
      t.string :password_digest, :limit => 50
      t.string :company_name, :limit => 30
      t.string :representative, :limit => 30
      t.integer :capital, :limit => 6
      t.integer :sales, :limit => 6
      t.integer :employee, :limit => 6
      t.string :url, :limit => 255
      t.string :country, :limit => 10
      t.integer :zip, :limit => 4
      t.string :state, :limit => 10
      t.string :city, :limit => 10
      t.string :other_address, :limit => 50
      t.integer :phone_num, :limit => 6
      t.string :business_content, :limit => 255
      t.string :main_item, :limit => 255
      t.text :appeal_point
      t.decimal :evaluation, :precision => 1, :scale =>1
      t.boolean :credit_check_flag
      t.timestamps
    end
  end
end
