class AddContextIdToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :context_id, :integer
  end
end
