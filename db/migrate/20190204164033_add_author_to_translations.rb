class AddAuthorToTranslations < ActiveRecord::Migration[5.2]
  def change
    add_reference :translations, :author, index: true, null: true, foreign_key: {to_table: :users}
  end
end