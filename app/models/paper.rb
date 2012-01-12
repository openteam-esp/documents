# encoding: utf-8

class Paper < ActiveRecord::Base
  abstract_class = true

  alias_attribute :to_s,  :title

  validates_presence_of :kind, :authority, :title, :published_on

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
    hash = {}

    common_attributes.each do |attribute|
      hash[attribute] = self.send(attribute)
    end

    hash
  end

  def common_attributes
    %w[title authority id published_on]
  end

  private
    def reset_file_url
      self.file_url = nil if self.file_url.blank?
    end
end
