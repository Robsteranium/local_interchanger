class AddToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :agreed, :boolean
    add_column :transactions, :confirmed, :boolean
  end

  def self.down
    remove_column :transactions, :agreed
    remove_column :transactions, :confirmed
  end
end
