# encoding: utf-8

class Paper < ActiveRecord::Base
  validates_presence_of :kind, :authority, :title, :published_on

  has_enum :kind

  alias_attribute :to_s, :title

  searchable do
    string  :type
    text    :title
  end

  def description
    res = "#{authority}, #{human_kind.mb_chars.downcase} "
    res << "от #{I18n.l(approved_on)} " if approved_on
    res << "№#{number}" if number
    res
  end
end
