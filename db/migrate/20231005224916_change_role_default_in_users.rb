class ChangeRoleDefaultInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, from: 'User', to: 'user'
  end
end
