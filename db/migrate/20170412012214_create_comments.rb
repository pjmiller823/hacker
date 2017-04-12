class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :story_id
      t.string :body
      t.integer :created_by_id

      t.timestamps
    end
  end
end
