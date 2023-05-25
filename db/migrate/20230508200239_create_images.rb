class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :uuid do |t|
      t.string :file_name
      t.belongs_to :imageable, polymorphic: true, type: :uuid
      t.timestamps
    end
  end
end
