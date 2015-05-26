class TodoListsController < ApplicationController

  def list
    @todo_items = current_user.todo_items.order(updated_at: :desc)
    @new_todo = TodoItem.new
    @tags = Tag.joins(:todo_items)
      .where(todo_items:{user_id: current_user.id})
      .order(updated_at: :desc)
  end

end
