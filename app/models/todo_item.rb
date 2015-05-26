class TodoItem < ActiveRecord::Base
  belongs_to :user, :inverse_of => :todo_items
  validates :text, presence: true
end
