class CreateProblemsAgain < ActiveRecord::Migration[4.2]
  def change
    create_table :problems do |t|
      t.timestamps null: true
    end
  end
end
