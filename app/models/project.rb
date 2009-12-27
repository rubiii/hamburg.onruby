class Project < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :link

end
