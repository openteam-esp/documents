class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :kind
      t.string :authority
      t.text :title
      t.date :published_on

      t.timestamps
    end
  end
end
