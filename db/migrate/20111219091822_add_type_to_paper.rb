class AddTypeToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :type, :string
  end
end
