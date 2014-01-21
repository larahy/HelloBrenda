class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags do |t|
      t.belongs_to :article
      t.belongs_to :tag
      t.timestamps
    end
    add_index :articles_tags, [:article_id, :tag_id]
  end
end
