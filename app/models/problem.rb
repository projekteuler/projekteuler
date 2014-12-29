class Problem < ActiveRecord::Base
  has_one :translation
  delegate :title, :content, to: :translation

  has_many :translations, inverse_of: :problem
  
  self.per_page = 50
end
