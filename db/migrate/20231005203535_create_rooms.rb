class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
