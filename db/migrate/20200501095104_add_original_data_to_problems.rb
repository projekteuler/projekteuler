class AddOriginalDataToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :pulled_at, :datetime
    add_column :problems, :original_title, :string
    add_column :problems, :original_content, :text
  end
end
