class CreateCategoriesPapers < ActiveRecord::Migration
  def change
    create_table :categories_papers do |t|
      t.references :category
      t.references :paper

      t.timestamps
    end
    add_index :categories_papers, :category_id
    add_index :categories_papers, :paper_id
  end
end
