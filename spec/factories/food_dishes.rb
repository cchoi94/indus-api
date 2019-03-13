FactoryBot.define do
  factory :food_dish do
    name { "MyString" }
    description { "MyString" }
    cost { 1.5 }
    number_of_orders { 1 }
    menu { nil }
  end
end
