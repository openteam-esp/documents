# encoding: utf-8

class Document < Paper
  has_many :assertations_for_project, :class_name => 'Assertation', :foreign_key => :subject_id, :dependent => :destroy
  has_many :asserted_projects, :through => :assertations_for_project, :source => :objekt

  has_many :cancels_for_documents, :class_name => 'Cancel', :foreign_key => :subject_id, :dependent => :destroy
  has_many :canceled_documents, :through => :cancels_for_documents, :source => :objekt

  has_many :changes_for_documents, :class_name => 'Change', :foreign_key => :subject_id, :dependent => :destroy
  has_many :changed_documents, :through => :changes_for_documents, :source => :objekt

  validates_presence_of :number, :approved_on

  accepts_nested_attributes_for :assertations_for_project
  accepts_nested_attributes_for :cancels_for_documents
  accepts_nested_attributes_for :changes_for_documents

  alias :assertations :assertations_for_project
  alias :cancels      :cancels_for_documents
  alias :changes      :changes_for_documents

  def to_json
    super.merge!('kind' => human_kind, 'approved_on' => approved_on, 'number' => number)
  end
end
