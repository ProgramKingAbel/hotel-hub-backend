class AddDeviseTokenAuthToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :uid, null: false, default: ""
      t.string :provider, null: false, default: "email"
      t.json :tokens
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
