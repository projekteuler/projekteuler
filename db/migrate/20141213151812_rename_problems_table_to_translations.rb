class RenameProblemsTableToTranslations < ActiveRecord::Migration
  def change
    rename_table :problems, :translations
  end
end
