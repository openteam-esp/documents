class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.references :subject
      t.references :objekt

      t.timestamps
    end
    add_index :changes, :subject_id
    add_index :changes, :objekt_id
  end
end
