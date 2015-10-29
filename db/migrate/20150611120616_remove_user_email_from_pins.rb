class RemoveUserEmailFromPins < ActiveRecord::Migration
  def change
    remove_column :pins, :user_email, :string
  end
end
