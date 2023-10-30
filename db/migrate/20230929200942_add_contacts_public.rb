class AddContactsPublic < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :public, :boolean, default: false, null: false
  end
end
