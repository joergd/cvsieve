FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :business do
    name "KFC"
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

end
