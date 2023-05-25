class CreatePhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers, id: :uuid do |t|
      t.references :contact, type: :uuid, foreign_key: true
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
