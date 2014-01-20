class CreateTagsAndArticles < ActiveRecord::Migration
  def change
    create_table :tags_and_articles do |t|
      t.belongs_to :tag
      t.belongs_to :article
    end
  end
end
