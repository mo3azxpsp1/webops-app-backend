class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false

      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
