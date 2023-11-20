FactoryBot.define do
  factory :synonym do
    word { Faker::Lorem.word }
    synonym { Faker::Lorem.word }
    status { :draft }
  end
end
