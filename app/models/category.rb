class Category < ActiveRecord::Base
  belongs_to :context
  attr_accessible :title
end
