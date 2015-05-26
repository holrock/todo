class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :text
      t.boolean :finished

      t.timestamps null: false
    end
  end
end
