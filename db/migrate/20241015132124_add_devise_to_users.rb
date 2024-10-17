# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "" unless column_exists?(:users, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :email)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :email)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :email)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :email)

    end

    unless index_exists?(:users, :email)
    add_index :users, :email,                unique: true
  end

    unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true
  end
end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end