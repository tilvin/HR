FactoryGirl.define do

  factory :vacancy do
    name 'name1'
    date_until Date.today.days_since(2)
  end

  factory :user do
    name 'Один Два Три'
    contact 'example@example.ru'
  end
end