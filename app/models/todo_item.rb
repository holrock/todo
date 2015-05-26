class TodoItem < ActiveRecord::Base
  belongs_to :user, :inverse_of => :todo_items
  has_many :todo_tags
  has_many :tags, through: :todo_tags

  validates :text, presence: true
end
