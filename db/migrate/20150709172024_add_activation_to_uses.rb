class AddActivationToUses < ActiveRecord::Migration
  def change
    add_column :uses, :activation_digest, :string
    add_column :uses, :activated, :boolean, default: false
    add_column :uses, :activated_at, :datetime
  end
end
