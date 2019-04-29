class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :author
      t.text :content
      t.text :description
      t.date :publishedAt
      t.string :title
      t.string :url
      t.string :urlToImage
      t.boolean :enable, default: true

      t.timestamps
    end
  end
end
