class Problem < ActiveRecord::Base
  has_one :translation
  has_many :translations, inverse_of: :problem
end
