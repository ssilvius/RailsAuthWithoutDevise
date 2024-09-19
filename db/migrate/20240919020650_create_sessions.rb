class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :token, null: false
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
    add_index :sessions, :token, unique: true
  end
end
