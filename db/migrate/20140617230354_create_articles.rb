class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.float :price, :default=> 0.0
      t.integer :total_in_shelf, :default=> 0
      t.integer :total_in_vault, :default=> 0
      t.references :store
      t.timestamps
    end

    add_index :articles, :store_id
  end
end
