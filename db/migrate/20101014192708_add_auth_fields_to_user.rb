class AddAuthFieldsToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string   "crypted_password",    :default => "", :null => false
      t.string   "password_salt",       :default => "", :null => false
      t.string   "persistence_token",   :default => "", :null => false
      t.string   "single_access_token", :default => "", :null => false
      t.string   "perishable_token",    :default => "", :null => false
      t.integer  "login_count",         :default => 0,  :null => false
      t.integer  "failed_login_count",  :default => 0,  :null => false
      t.datetime "last_request_at"
      t.datetime "current_login_at"
      t.datetime "last_login_at"
      t.string   "current_login_ip"
      t.string   "last_login_ip"
    end
  end

  def self.down
    change_table :users do |t|
      t.remove   "crypted_password"
      t.remove   "crypted_password"
      t.remove   "password_salt"
      t.remove   "persistence_token"
      t.remove   "single_access_token"
      t.remove   "perishable_token"
      t.remove  "login_count"
      t.remove  "failed_login_count"
      t.remove "last_request_at"
      t.remove "current_login_at"
      t.remove "last_login_at"
      t.remove "current_login_ip"
      t.remove "last_login_ip"
    end
  end
end
