class User < ActiveRecord::Base
  acts_as_authentic
  has_many :products
  has_many :sales, :foreign_key => :user_from, :class_name => 'Transaction', :conditions => ['confirmed = ?', true]
  has_many :purchases, :foreign_key => :user_to, :class_name => 'Transaction', :conditions => ['confirmed = ?', true]
  has_many :psales, :foreign_key => :user_from, :class_name => 'Transaction', :conditions => "confirmed IS NOT 'TRUE'"
  has_many :ppurchases, :foreign_key => :user_to, :class_name => 'Transaction', :conditions => "confirmed IS NOT 'TRUE'"
  accepts_nested_attributes_for :products, :reject_if => lambda { |u| u[:product_id].blank? }, :allow_destroy => true

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def offers  # redundant now?
    self.products
  end

  def requests
    #self.userproducts.request
    nil
  end

  def self.find_by_username_or_email(login)
    User.find_by_username(login) || User.find_by_email(login)
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Postoffice.deliver_password_reset_instructions(self)
  end

  def commitment
    self.purchases.select{|p| p.confirmed == true}.collect(&:value).sum
  end

  def credit
    self.sales.select{|s| s.confirmed == true}.collect(&:value).sum
  end

  def balance
    (self.credit - self.commitment).round
  end

  def balance_status
    if self.balance == 0
      return "balance"
    elsif self.balance > 0
      return "credit"
    elsif self.balance < 0
      return "commitment"
    end
  end

end
