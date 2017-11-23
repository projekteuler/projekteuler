class AddProblemToTranslation < ActiveRecord::Migration[4.2]
  def change
    add_reference :translations, :problem, index: true
  end
end
