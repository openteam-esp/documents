class AddPapersCountToContext < ActiveRecord::Migration
  def change
    add_column :contexts, :papers_count, :integer

  end
end
