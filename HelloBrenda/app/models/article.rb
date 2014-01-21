class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_attached_file :image, 
                    styles: { thumb: "300x300>" }, 
                    storage: :s3, 
                    s3_credentials: {
                      access_key_id: ENV['S3_KEY_ID'],
                      secret_access_key: ENV['S3_ACCESS_KEY']
                      },
                    bucket: 'HelloBrendaPhotos'
end
