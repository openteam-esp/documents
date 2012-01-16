# encoding: utf-8

class Paper < ActiveRecord::Base
  abstract_class = true

  alias_attribute :to_s,  :title

  validates_presence_of :kind, :authority, :title, :published_on, :file_url

  after_validation :reset_file_url

  default_value_for :published_on, Date.today

  has_enums

  searchable do
    text :title
  end

  def description
    res = "#{authority}, #{human_kind.mb_chars.downcase} "
    res << "от #{I18n.l(approved_on)} " if approved_on
    res << "№#{number}" if number
    res
  end

  def to_json
    {}.tap do |hash|
      common_attributes.each do |attribute|
        hash[attribute] = self.send(attribute)
      end

      hash['kind'] = self.human_kind
      hash['canceled'] = self.canceled?
    end
  end

  def common_attributes
    %w[title authority id published_on]
  end

  private
    def reset_file_url
      self.file_url = nil if self.file_url.blank?
    end
end
# == Schema Information
#
# Table name: papers
#
#  id           :integer         not null, primary key
#  kind         :string(255)
#  authority    :string(255)
#  title        :text
#  published_on :date
#  created_at   :datetime
#  updated_at   :datetime
#  number       :string(255)
#  approved_on  :date
#  type         :string(255)
#  state        :string(255)
#  file_url     :string(255)
#  deflected_on :date
#

