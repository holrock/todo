class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.belongs_to :user
      t.string :title
      t.integer :list_order
      t.timestamps null: false
    end
  end
end
