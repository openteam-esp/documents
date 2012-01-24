class Document < Paper
  has_many :assertations_for_project, :class_name => 'Assertation', :foreign_key => :subject_id, :dependent => :destroy
  has_many :asserted_projects, :through => :assertations_for_project, :source => :objekt

  has_many :cancels_for_documents, :class_name => 'Cancel', :foreign_key => :subject_id, :dependent => :destroy
  has_many :canceled_documents, :through => :cancels_for_documents, :source => :objekt

  has_many :changes_for_documents, :class_name => 'Change', :foreign_key => :subject_id, :dependent => :destroy
  has_many :changed_documents, :through => :changes_for_documents, :source => :objekt

  default_scope order('approved_on DESC')

  validates_presence_of :number, :approved_on

  alias :assertations :assertations_for_project
  alias :cancels      :cancels_for_documents
  alias :changes      :changes_for_documents

  searchable do
    integer :object_id do |d| document.id end

    text :title
  end

  def deflected?
    false
  end

  def asserted_by
    []
  end

  def canceled?
    state == 'canceled'
  end

  def to_json
    super.merge!('approved_on' => approved_on, 'number' => number).tap do |hash|
      hash['asserted_projects']   = asserted_projects.map(&:to_json)
      hash['canceled_documents']  = canceled_documents.map(&:to_json)
      hash['changed_documents']   = changed_documents.map(&:to_json)
    end
  end

  # TODO: как-нибудь отрефакторить следующие три метода
  def cancel_candidates(search_options, paginate_options)
    self.class.search do
      keywords  search_options.try(:[], :keywords) || ''
      paginate  paginate_options
      without   :object_id, [id] + canceled_document_ids
    end.results
  end

  def change_candidates(search_options, paginate_options)
    self.class.search do
      keywords  search_options.try(:[], :keywords) || ''
      paginate  paginate_options
      without   :object_id, [id] + changed_document_ids
    end.results
  end

  def assertation_candidates(search_options, paginate_options)
    Project.search do
      keywords  search_options.try(:[], :keywords) || ''
      paginate  paginate_options
      with      :state, 'actual'
      without   :object_id, [id] + asserted_project_ids
    end.results
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

