class Context < ActiveRecord::Base
  alias_attribute :to_s, :title

  attr_accessible :id, :title, :ancestry, :weight

  has_many :documents
  has_many :permissions
  has_many :projects
  has_many :users, :through => :permissions

  default_scope order('weight')

  scope :with_papers, where('papers_count > 0')

  has_ancestry

  searchable do
    text :title
  end

  def to_json
    { :id => id, :title => title }
  end
end
# == Schema Information
#
# Table name: contexts
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  title      :string(255)
#  ancestry   :string(255)
#  weight     :string(255)
#  position   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

