# encoding: utf-8

class Paper < ActiveRecord::Base
  abstract_class = true

  alias_attribute :to_s,  :title

  belongs_to :context

  delegate :title, :to => :context, :prefix => true

  validates_presence_of :kind, :title, :published_on, :file_url, :context

  after_validation :reset_file_url, :unless => :file_url?

  before_save :set_authority

  after_destroy :send_remove_message

  default_value_for :published_on do
    Date.today
  end

  has_enums

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
    %w[authority file_url id published_on title]
  end

  private
    def reset_file_url
      self.file_url = nil
    end

    def set_authority
      self.authority = self.context.title
    end

    def message_for_queue
      { 'context_id' => context_id, 'id' => id, 'kind' => self.class.name.underscore }
    end

    def send_add_message
      MessageMaker.make_message 'esp.documents.cms', 'add', message_for_queue
    end

    def send_remove_message
      MessageMaker.make_message 'esp.documents.cms', 'remove', message_for_queue
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
#  deflected_on :date
#  file_url     :string(255)
#  context_id   :integer
#

