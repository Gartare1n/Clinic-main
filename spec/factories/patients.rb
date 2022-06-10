FactoryBot.define do
  factory :random_patient, class: Patient do 
    email { Faker::Internet.safe_email }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    password { Faker::Internet.password }
  end
end