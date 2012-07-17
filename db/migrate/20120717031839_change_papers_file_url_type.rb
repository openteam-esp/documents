class ChangePapersFileUrlType < ActiveRecord::Migration
  def up
    change_column :papers, :file_url, :text
  end

  def down
    change_column :papers, :file_url, :string
  end
end
