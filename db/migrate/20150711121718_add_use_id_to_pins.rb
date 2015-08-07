class AddUseIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :use_id, :integer
    add_index :pins, :use_id
  end
end
