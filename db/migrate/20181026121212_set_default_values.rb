class SetDefaultValues < ActiveRecord::Migration[5.2]
  def up
    change_column :tests, :level, :integer, default: 0
    change_column :answers, :correct, :boolean, default: false
  end

  def down
    change_column :tests, :level, :integer, default: 0
    change_column :answers, :correct, :boolean, default: false
  end
end
