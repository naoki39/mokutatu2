class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.text :text, null: false
    end
  end
end
