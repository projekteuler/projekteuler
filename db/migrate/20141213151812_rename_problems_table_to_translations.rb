class RenameProblemsTableToTranslations < ActiveRecord::Migration[4.2]
  def change
    rename_table :problems, :translations
  end
end
