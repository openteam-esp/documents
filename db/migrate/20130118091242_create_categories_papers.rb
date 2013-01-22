class CreateCategoriesPapers < ActiveRecord::Migration
  def change
    create_table :categories_papers, :id => false do |t|
      t.references :category
      t.references :paper
    end
    add_index :categories_papers, :category_id
    add_index :categories_papers, :paper_id
  end
end
