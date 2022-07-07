require 'faker'

FactoryBot.define do
  factory :payment do
    name { Faker::Name.name }
    amount { Faker::Number.non_zero_digit }
    association :author, factory: :user
    factory :payment_with_groups do
      groups { [association(:group)] }
    end
  end
end