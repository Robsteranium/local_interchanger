class CreateUserproducts < ActiveRecord::Migration
  def self.up
    create_table :userproducts do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :offer_vs_request
      t.float :fee
      t.string :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :userproducts
  end
end
