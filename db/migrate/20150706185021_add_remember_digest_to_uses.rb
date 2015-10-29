class AddRememberDigestToUses < ActiveRecord::Migration
  def change
    add_column :uses, :remember_digest, :string
  end
end
