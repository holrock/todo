class TodoListsController < ApplicationController

  def list
    @todo_items = current_user.todo_items.order(updated_at: :desc)
    @new_todo = TodoItem.new
    @tags = current_user.uniq_tag
  end

end
