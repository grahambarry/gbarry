class AddAdminToUses < ActiveRecord::Migration
  def change
    add_column :uses, :admin, :boolean
  end
end
