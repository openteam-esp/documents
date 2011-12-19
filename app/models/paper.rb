class Paper < ActiveRecord::Base
  validates_presence_of :kind, :authority, :title, :published_on

  has_enum :kind

  alias_attribute :to_s, :title
end
