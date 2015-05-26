class TodoItem < ActiveRecord::Base
    validates :text, presence: true
end
