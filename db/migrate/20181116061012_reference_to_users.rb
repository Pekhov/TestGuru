class ReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :tests do |t|
      t.references :user
    end
  end
end
