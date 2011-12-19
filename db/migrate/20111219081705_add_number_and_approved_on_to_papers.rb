class AddNumberAndApprovedOnToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :number, :string
    add_column :papers, :approved_on, :date
  end
end
