class Project < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name
  validate :link_format

private

  def link_format
    match = URI::regexp(["http", "https"]).match(link)
    errors.add(:link, :invalid) unless match && match[4]
  end

end
