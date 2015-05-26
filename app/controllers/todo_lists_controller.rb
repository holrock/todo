class TodoListsController < ApplicationController
  #before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def list
    @todo_items = current_user.todo_items.order("updated_at DESC")
    @new_todo = TodoItem.new
  end

end
