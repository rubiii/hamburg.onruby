class User < ActiveRecord::Base

  acts_as_authentic
  has_friendly_id :username
  has_gravatar :email, :size => 60

  has_many :projects
  accepts_nested_attributes_for :projects, :allow_destroy => true, :reject_if => :all_blank

  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false

  validates_presence_of :email
  validates_presence_of :password

end
