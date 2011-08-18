class Product < ActiveRecord::Base
  belongs_to :registry
  belongs_to :user
  has_many :tags
  has_many :transactions
  has_many :bought_by, :through => :transactions
  has_many :sold_by, :through => :transactions
  
end
