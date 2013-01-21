class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :context
      t.text :title

      t.timestamps
    end
    add_index :categories, :context_id
  end
end
