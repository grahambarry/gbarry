class AddResetToUses < ActiveRecord::Migration
  def change
    add_column :uses, :reset_digest, :string
    add_column :uses, :reset_sent_at, :datetime
  end
end
