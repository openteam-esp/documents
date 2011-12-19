class Paper < ActiveRecord::Base
  validates_presence_of :kind, :authority, :title, :published_on
end
