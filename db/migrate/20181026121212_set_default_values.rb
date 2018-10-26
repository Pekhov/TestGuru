class SetDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :level, :integer, default: 0
    change_column :answers, :correct, :boolean, default: true
  end
end
