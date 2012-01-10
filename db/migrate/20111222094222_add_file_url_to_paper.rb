class AddFileUrlToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :file_url, :string
  end
end
