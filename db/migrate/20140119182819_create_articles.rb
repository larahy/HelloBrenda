class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :image_url1
      t.text :image_url2
      t.text :image_url3
      t.text :image_url4
      t.text :image_url5

      t.timestamps
    end
  end
end
