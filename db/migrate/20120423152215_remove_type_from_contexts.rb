class RemoveTypeFromContexts < ActiveRecord::Migration
  def change
    remove_column :contexts, :type
  end
end
