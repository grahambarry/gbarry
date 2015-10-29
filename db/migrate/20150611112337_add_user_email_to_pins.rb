class AddUserEmailToPins < ActiveRecord::Migration
  def change
    add_column :pins, :user_email, :string
  end
end
