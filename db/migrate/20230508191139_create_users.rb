class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
