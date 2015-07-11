class CreatePinColors < ActiveRecord::Migration
  def change
    create_table :pin_colors do |t|
      t.integer :pin_id
      t.string :original_color
      t.string :reference_color
      t.float :frequency
      t.float :distance

      t.timestamps
    end

    add_index :pin_colors, :pin_id
    add_index :pin_colors, :original_color
    add_index :pin_colors, :reference_color
    add_index :pin_colors, :frequency
    add_index :pin_colors, :distance
  end
end