class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles

  def to_s
    "#"+tag
  end

  # def to_param
  #   tag
  # end
  
end
