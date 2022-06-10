require 'rails_helper'
require 'spec_helper'

RSpec.describe Doctor, type: :model do
  context 'validation test' do
    #let(:doctor) { build(:doctor) }
    it 'Phone number is too long' do
      visit "/welcome/index"
      fill_in :doctor_phone, with: "1432432425325325325325325"
      fill_in :doctor_password, with: "password123"
      click_on 'Log in'
    end

    #it 'Phone number is too short' do
  
    #end

    #it 'Phone number not a number' do
  
    #end

    #it 'Phone number cant be blank' do
  
    #end

  end
end