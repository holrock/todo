class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.belongs_to :todo_list
      t.string :text
      t.boolean :finished
      t.timestamps null: false
    end

    create_table :todo_lists do |t|
      t.belongs_to :user
      t.string :title
      t.integer :list_order
      t.timestamps null: false
    end
  end
end
