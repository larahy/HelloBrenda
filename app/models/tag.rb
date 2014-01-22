class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  before_validation :format_name

  def to_s
    "#"+tag
  end

  def self.find_or_create_by_tag_input(tag_input)
    tag_input.split(/,\s?/).map do |tag|
      find_or_create_by(tag: tag)
    end
  end

  private

  def format_name
    self.tag = tag.downcase.gsub(/[^a-z]/, '')
  end

  # def to_param
  #   tag
  # end
  
end
