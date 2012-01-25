class RemovePapersCountFromContext < ActiveRecord::Migration
  def up
    remove_column :contexts, :papers_count
  end

  def down
    add_column :contexts, :papers_count, :integer
  end
end
