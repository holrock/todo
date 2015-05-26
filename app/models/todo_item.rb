class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, dependent: :destroy

  validates :text, presence: true
  validates :todo_list_id, presence: true
end
