class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :user_from
      t.integer :user_to
      t.integer :product_id
      t.float :value
      t.date :date_exchanged
      t.integer :registry_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
