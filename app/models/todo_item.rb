class TodoItem < ActiveRecord::Base
  belongs_to :TotoLists

  validates :text, presence: true
end
