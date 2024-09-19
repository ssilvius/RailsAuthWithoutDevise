class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :password_digest
      t.datetime :email_validated_at
      t.datetime :cookies_accepted_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
