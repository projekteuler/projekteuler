class AddTranslationToProblem < ActiveRecord::Migration[4.2]
  def change
    add_reference :problems, :translation, index: true
  end
end
