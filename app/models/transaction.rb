class Transaction < ActiveRecord::Base
  belongs_to :registry
  belongs_to :seller, :foreign_key => :user_from, :class_name => 'User'
  belongs_to :buyer, :foreign_key => :user_to, :class_name => 'User'
  belongs_to :product

  def status
    if self.agreed.nil?
      "new"
    elsif self.agreed == true
      if self.confirmed.nil?
        "agreed"
      elsif self.confirmed == true
        "confirmed"
      else
        "disputed"
      end
    else
      "cancelled"
    end
  end

end
