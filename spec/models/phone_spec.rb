require 'rails_helper'

RSpec.describe Patient, :type => :model do
  before do
    @patient = Patient.new(email: "example@example.com", phone: "434345357777", password: "password123", password_confirmation: "password123")
  end
  it "Phone number is too long" do
    @patient.phone = "4143" * 10
    expect(@patient).to_not be_valid
  end
  it 'Phone number is too short' do
    @patient.phone = "4143"
    expect(@patient).to_not be_valid
  end

  it 'Phone number not a number' do
    @patient.phone = "4143FEF3414=-geg1"
    expect(@patient).to_not be_valid
  end

  it 'Phone number cant be blank' do
    @patient.phone = ""
    expect(@patient).to_not be_valid
  end
end