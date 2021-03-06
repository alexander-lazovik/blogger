class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings
  
  before_destroy :destroy_taggings
  
   private

   def destroy_taggings
     self.taggings.destroy_all   
   end

end
