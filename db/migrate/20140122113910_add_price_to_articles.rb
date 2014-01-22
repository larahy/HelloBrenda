class AddPriceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :price, :integer
  end
end
