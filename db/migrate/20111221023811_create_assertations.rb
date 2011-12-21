class CreateAssertations < ActiveRecord::Migration
  def change
    create_table :assertations do |t|
      t.references :subject
      t.references :objekt

      t.timestamps
    end
    add_index :assertations, :subject_id
    add_index :assertations, :objekt_id
  end
end
