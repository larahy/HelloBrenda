class RemoveImagesFromArticles < ActiveRecord::Migration
  def change 
    change_table :articles do |t|
      t.remove :image_url1, :image_url2, :image_url3, :image_url4, :image_url5
    end
  end
end


