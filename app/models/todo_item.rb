class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :text, presence: true
end
