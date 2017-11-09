FactoryGirl.define do
  factory :content do
    url 'http://www.google.com'
    content 'This is content body'
  end

  trait :invalid do
    url nil
    content nil
  end
end
