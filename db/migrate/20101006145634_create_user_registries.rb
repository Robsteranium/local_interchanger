class CreateUserRegistries < ActiveRecord::Migration
  def self.up
    create_table :user_registries do |t|
      t.integer :user_id
      t.integer :registry_id
      t.string :foreign_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_registries
  end
end
