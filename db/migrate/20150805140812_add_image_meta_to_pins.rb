class AddImageMetaToPins < ActiveRecord::Migration
def change
    add_column :pins, :image_meta, :text
  end
end
