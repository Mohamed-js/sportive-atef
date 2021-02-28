class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :image
      t.integer :author_id
      t.integer :category_id

      t.timestamps
    end
  end
end
