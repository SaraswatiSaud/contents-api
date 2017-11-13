FactoryBot.define do
  factory :content do
    url 'http://www.google.com'
  end

  trait :invalid do
    url nil
  end
end
