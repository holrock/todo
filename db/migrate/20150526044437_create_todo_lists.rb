class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.belongs_to :user
      t.string :text
      t.boolean :finished
      t.timestamps null: false
    end
  end
end
