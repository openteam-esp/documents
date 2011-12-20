# encoding: utf-8

class Document < Paper
  # изменяет документы
  has_many :changes_for_documents, :class_name => 'Change', :foreign_key => :subject_id, :dependent => :destroy
  has_many :changed_documents, :through => :changes_for_documents, :source => :objekt

  accepts_nested_attributes_for :changed_documents

  # изменяется документами
  has_many :changes, :foreign_key => :objekt_id, :dependent => :destroy
  has_many :changing_documents, :through => :changes, :source => :subject

  validates_presence_of :number, :approved_on
end
