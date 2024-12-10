class RemovePasswordFromUserProfiles < ActiveRecord::Migration[7.2]
  def change
    if table_exists?(:user_profiles)
    remove_column :user_profiles, :password, :string
  end
 end
end
