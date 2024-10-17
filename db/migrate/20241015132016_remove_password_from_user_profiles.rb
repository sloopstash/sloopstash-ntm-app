class RemovePasswordFromUserProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :user_profiles, :password, :string
  end
end
