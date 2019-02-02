class AddStatusToTranslations < ActiveRecord::Migration[5.2]
  def change
    add_column :translations, :status, :integer, default: 0
    
    reversible do |dir|
      dir.up do
        Problem.all.each do |problem|
          if problem.is_translated?
            problem.translation.in_use!
          end
        end
      end
    end
  end
end
