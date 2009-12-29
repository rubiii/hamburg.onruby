class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.require_password_confirmation = false
    c.ignore_blank_passwords = true
  end

  has_friendly_id :username
  has_gravatar :email, :size => 60

  has_many :projects
  accepts_nested_attributes_for :projects, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
