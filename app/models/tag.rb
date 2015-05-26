class Tag < ActiveRecord::Base
  has_many :todo_tags
  has_many :todo_items, through: :todo_tags
end
