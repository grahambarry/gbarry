class AddAspectToPins < ActiveRecord::Migration
  def change
    add_column :pins, :aspect, :integer
  end
end
