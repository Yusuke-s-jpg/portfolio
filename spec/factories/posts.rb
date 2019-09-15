FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    photo_name { "MyString" }
    user_id { 1 }
  end
end
