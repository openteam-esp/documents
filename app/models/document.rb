# encoding: utf-8

class Document < Paper
  has_many :cancels_for_documents, :class_name => 'Cancel', :foreign_key => :subject_id, :dependent => :destroy
  has_many :canceled_documents, :through => :cancels_for_documents, :source => :objekt

  has_many :changes_for_documents, :class_name => 'Change', :foreign_key => :subject_id, :dependent => :destroy
  has_many :changed_documents, :through => :changes_for_documents, :source => :objekt

  accepts_nested_attributes_for :canceled_documents
  accepts_nested_attributes_for :changed_documents

  validates_presence_of :number, :approved_on
end
