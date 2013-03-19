class Context < ActiveRecord::Base
  attr_accessible :title, :ancestry, :weight

  has_many :papers
  has_many :categories
  has_ancestry

  default_scope order('weight')
  scope :with_papers, joins(:papers).uniq

  def to_json
    { title => id }
  end

  alias_attribute :to_s, :title

  def subtree_condition
    "#{child_ancestry}/%"
  end
end

# == Schema Information
#
# Table name: contexts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  ancestry   :string(255)
#  weight     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

