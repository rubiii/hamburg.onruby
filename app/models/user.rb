class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_friendly_id :username
  has_gravatar :email, :size => 60

  has_many :projects
  accepts_nested_attributes_for :projects, :allow_destroy => true, :reject_if => :all_blank

  validates_presence_of :password

end
