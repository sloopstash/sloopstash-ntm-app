class AddPasswordDigestToUsers < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:users, :password_digest)
    add_column :users, :password_digest, :string
  end
 end
end
