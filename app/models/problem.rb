class Problem < ApplicationRecord
  # TODO Check whether there is a better relation for this
  belongs_to :translation, optional: true
  delegate :title, :content, to: :translation

  has_many :translations, inverse_of: :problem
  has_many :authors, -> { where(translations: { status: [:in_use, :outdated] }).distinct }, through: :translations

  self.per_page = 50

  def is_translated?
    !!self.translation
  end

  def set_translation(translation)
    if self.is_translated?
      self.translation.outdated!
    end
    self.update(translation: translation)
    self.translation.in_use!
  end

  def has_anonymous_author?
    translations.where(status: [:in_use, :outdated], author: nil).any?
  end

  def original_url
    "https://projecteuler.net/problem=#{self.id}"
  end

  def self.translated_count
    Problem.count(:translation_id)
  end

  def self.update_count(new_count)
    old_count = Problem.count
    raise ArgumentError, "new count has to be larger than old count" if new_count < old_count

    new_count.times do |i|
      Problem.where(id: i + 1).first_or_create!
    end
  end
end
