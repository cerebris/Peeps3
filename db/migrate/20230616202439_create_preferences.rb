class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences, id: :uuid do |t|
      t.string :favorite_color
      t.boolean :notify_about_new_contacts
      t.belongs_to :user, index: { unique: true }, foreign_key: true, type: :uuid
    end
  end
end
