class AddContactCreatedBy < ActiveRecord::Migration[7.0]
  def change
    add_reference :contacts, :created_by_user, type: :uuid,  foreign_key: { to_table: :users }
  end
end
