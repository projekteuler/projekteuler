class Problem < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true

  self.per_page = 50

  def original_url
    "https://projecteuler.net/problem=#{id}"
  end
end
