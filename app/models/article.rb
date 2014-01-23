class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_attached_file :image, 
                    styles: { thumb: "300x300>" }, 
                    storage: :s3, 
                    s3_credentials: {
                      access_key_id: ENV['S3_KEY_ID'],
                      secret_access_key: ENV['S3_ACCESS_KEY']
                      },
                    bucket: 'HelloBrendaPhotos'

  def tag_input=(tag_input)
    self.tags = Tag.find_or_create_by_tag_input(tag_input)
  end

  def tag_input
    tags.map {|t| t.tag}.join(', ')
  end
  

  # def self.for_tag_or_all(tag_id)
  #   tag_id ? Tag.find_by(tag: tag).posts : all
  # end

  
end
