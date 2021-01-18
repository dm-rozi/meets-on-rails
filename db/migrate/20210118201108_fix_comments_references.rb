class FixCommentsReferences < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.change :event, index: true, foreign_key: true
      t.change :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
