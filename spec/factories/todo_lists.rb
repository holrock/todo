FactoryGirl.define do
  factory :todo_list do
    title "List1"
    list_order 1
    association :user, factory: :user
  end
end
