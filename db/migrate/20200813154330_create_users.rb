class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :password_digest
      t.boolean :admin?
      t.string :session_token
      t.string :first_name
      t.string :last_name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
