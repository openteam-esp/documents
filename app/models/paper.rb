# encoding: utf-8

class Paper < ActiveRecord::Base
  alias_attribute :to_s,  :title

  validates_presence_of :kind, :authority, :title, :published_on

  has_enums

  searchable do
    text :title
  end

  def description
    res = "#{authority}, #{human_kind.mb_chars.downcase} "
    res << "от #{I18n.l(approved_on)} " if approved_on
    res << "№#{number}" if number
  end

  def to_json
    hash = {}

    common_attributes.each do |attribute|
      hash[attribute] = self.send(attribute)
    end

    hash
  end

  def common_attributes
    %w[title authority title published_on]
  end
end
