class User < ActiveRecord::Base

  acts_as_authentic
  has_friendly_id :username
  has_gravatar

  validates_presence_of :username
  validates_format_of :username, :with => /^[A-Za-z0-9-]+$/,
    :message => 'The subdomain can only contain alphanumeric characters and dashes.',
    :allow_blank => true
  validates_uniqueness_of :username, :case_sensitive => false

end
