class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :todo_items, dependent: :destroy, inverse_of: :user

  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  def uniq_tag
    Tag.joins(:todo_items)
      .where(todo_items:{user_id: self.id}).uniq
      .order(updated_at: :desc)
  end
end
