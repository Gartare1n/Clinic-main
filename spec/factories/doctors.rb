FactoryBot.define do
  factory :doctor do 
    email { "doctor12@example.com" }
    phone { "380980335523" }
    password { "password" }
    #active true
  end

  factory :random_doctor, class: Doctor do 
    email { Faker::Internet.safe_email }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    password { Faker::Internet.password }
  end
end