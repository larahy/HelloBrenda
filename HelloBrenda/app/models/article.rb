class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_attached_file :image, styles: { thumb: "300x300>" }
end
