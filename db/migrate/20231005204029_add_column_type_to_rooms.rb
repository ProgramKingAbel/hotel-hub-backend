class AddColumnTypeToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :room_type, :string
  end
end
