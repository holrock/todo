FactoryGirl.define do
  factory :todo_item do
    text "Todo1"
    finished false
    association :todo_list, factory: :todo_list
  end

end
