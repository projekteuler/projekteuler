class AddTranslationToProblem < ActiveRecord::Migration
  def change
    add_reference :problems, :translation, index: true
  end
end
