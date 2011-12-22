class AddDeflectedOnToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :deflected_on, :date
  end
end
