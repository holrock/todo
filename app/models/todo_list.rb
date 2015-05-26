class TodoList < ActiveRecord::Base
  belongs_to :user, inverse_of: :todo_lists
  has_many :todo_items

  validates :title, presence: true

  scope :with_user, lambda {|user| where(user_id: user.id)}
end
