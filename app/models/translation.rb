class Translation < ActiveRecord::Base
  belongs_to :problem, inverse_of: :translations

  validates :title, :content, :problem, presence: true
  validates :title, uniqueness: true

  self.per_page = 50
end
