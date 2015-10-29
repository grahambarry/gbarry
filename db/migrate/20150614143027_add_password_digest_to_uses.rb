class AddPasswordDigestToUses < ActiveRecord::Migration
  def change
    add_column :uses, :password_digest, :string
  end
end
