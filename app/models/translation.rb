class Translation < ApplicationRecord
  belongs_to :problem, inverse_of: :translations
  belongs_to :author, class_name: 'User', inverse_of: :translations, optional: true
  enum status: [:pending, :in_use, :outdated, :declined]

  validates :title, :content, :problem_id, presence: true
  validate :title_is_unique_among_other_problems

  self.per_page = 50

  def has_author?
    !!self.author
  end

  def title_is_unique_among_other_problems
    Problem.includes(:translation).where.not(id: problem_id).each do |problem|
      if problem.is_translated? and problem.title == title
        errors.add(:title, :taken)
        break
      end
    end
  end
end
