class User < ActiveRecord::Base

  acts_as_authentic
  has_friendly_id :username
  has_gravatar :email, :size => 60

  has_many :projects
  accepts_nested_attributes_for :projects, :allow_destroy => true, :reject_if => :all_blank

  validates_format_of :username, :with => /^[A-Za-z0-9-]+$/,
    :message => "The username can only contain alphanumeric characters and dashes."
  validates_uniqueness_of :username, :case_sensitive => false

end
