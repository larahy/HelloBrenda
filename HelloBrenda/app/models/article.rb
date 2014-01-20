class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_attached_file :image, 
                    styles: { thumb: "300x300>" }, 
                    storage: :s3, 
                    s3_credentials: {
                      access_key_id: 'AKIAJDSSWRQYZB7YML4Q',
                      secret_access_key: Rails.application.secrets.secret_access_key 
                      },
                    bucket: 'HelloBrendaPhotos'
end
