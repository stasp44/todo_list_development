class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
