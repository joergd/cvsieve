FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :name do |n|
    "name#{n}"
  end

  factory :business do
    name
    email
    password "testtest"
    password_confirmation "testtest"
  end

  factory :admin do
    email
    password "testtest"
    password_confirmation "testtest"
  end

  factory :job do
    business
  end

  factory :application do
    job
    name "Jonny"
    email
    tel "02144242345"
    answer "this is my answer"
  end

end
