class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :destination_id
      t.integer :post_id
      t.string :role_name
      t.text :content

      t.timestamps null: false
    end
  end
end
