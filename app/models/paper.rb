# encoding: utf-8

class Paper < ActiveRecord::Base
  alias_attribute :to_s,  :title

  validates_presence_of :kind, :authority, :title, :published_on

  has_enum :kind, %w[decision direction order]

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
    as_json(:methods => 'description', :only => [:description])
  end
end
