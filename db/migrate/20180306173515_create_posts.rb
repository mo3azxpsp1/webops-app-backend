class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :body, null: false

      t.belongs_to :user

      t.timestamps
    end
  end
end
