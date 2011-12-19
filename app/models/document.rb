class Document < Paper
  validates_presence_of :number, :approved_on
end
