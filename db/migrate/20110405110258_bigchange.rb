class Bigchange < ActiveRecord::Migration
  def self.up
    drop_table :userproducts
    add_column :products, :user_id, :integer
    add_column :products, :fee, :integer
    create_table :tags do |t|
      t.integer :product_id
      t.string :term
      t.timestamps
    end
    create_table :requests do |t|
      t.integer :user_id
      t.integer :tag_id
    end
  end

  def self.down
    create_table :userproducts do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :offer_vs_request
      t.float :fee
      t.string :quantity
      t.timestamps
    end
    remove_column :products, :user_id
    remove_column :products, :fee
    drop_table :tags
    drop_table :requests
  end
end
