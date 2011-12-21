class CreateCancels < ActiveRecord::Migration
  def change
    create_table :cancels do |t|
      t.references :subject
      t.references :objekt

      t.timestamps
    end
    add_index :cancels, :subject_id
    add_index :cancels, :objekt_id
  end
end
