class Problem < ActiveRecord::Base
  # TODO Check whether there is a better relation for this
  belongs_to :translation
  delegate :title, :content, to: :translation

  has_many :translations, inverse_of: :problem
  
  self.per_page = 50

  def is_translated?
    !!self.translation
  end


  def original_url
    "https://projecteuler.net/problem=#{self.id}"
  end
end
