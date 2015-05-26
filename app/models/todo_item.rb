class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, dependent: :destroy

  validates :text, presence: true

  scope :with_list, lambda {|list| where(todo_list_id: list.id)}
end
