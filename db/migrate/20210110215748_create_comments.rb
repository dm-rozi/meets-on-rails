class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user_name
      t.references :event
      t.references :user

      t.timestamps
    end
  end
end
