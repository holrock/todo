class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :todo_items, dependent: :destroy, inverse_of: :user

  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
