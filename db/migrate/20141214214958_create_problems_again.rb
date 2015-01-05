class CreateProblemsAgain < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.timestamps null: true
    end
  end
end
