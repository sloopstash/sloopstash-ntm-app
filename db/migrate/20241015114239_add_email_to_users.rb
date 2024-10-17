class AddEmailToUsers < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:users, :email)
    add_column :users, :email, :string
  end
 end
end