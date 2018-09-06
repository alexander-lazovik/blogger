class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  
  def tag_list
    self.tags.collect {|t| t.name}.join(", ")
  end
  
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    all_tags = tag_names.collect {|t| Tag.find_or_create_by(name: t) }
    self.tags = all_tags
  end
end
