class AddProblemToTranslation < ActiveRecord::Migration
  def change
    add_reference :translations, :problem, index: true
  end
end
