class CreateUserProfiles < ActiveRecord::Migration[7.2]
  def change
    unless table_exists?(:users)
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
    end
  end
 end
end
