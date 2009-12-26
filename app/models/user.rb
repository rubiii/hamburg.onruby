class User < ActiveRecord::Base

  acts_as_authentic
  has_friendly_id :username
  has_gravatar

end
