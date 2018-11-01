class CreateUserHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_histories do |t|
      t.references :user
      t.references :test
      t.string :status

      t.timestamps
    end
  end
end
