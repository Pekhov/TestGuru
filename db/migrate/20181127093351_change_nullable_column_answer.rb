class ChangeNullableColumnAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :question_id, false)
  end
end
