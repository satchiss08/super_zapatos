class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :total_in_shelf
      t.integer :total_in_vault
      t.references :store
      t.timestamps
    end

    add_index :articles, :store_id
  end
end
