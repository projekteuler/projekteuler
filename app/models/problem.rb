class Problem < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true
end
