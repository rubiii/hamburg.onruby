class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_friendly_id :username
  has_gravatar :email, :size => 60

  has_many :projects
  accepts_nested_attributes_for :projects, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def deliver_password_reset_instructions!
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end

end
