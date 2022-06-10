require 'rails_helper'

RSpec.describe "DoctorsController", type: :request do
  describe Doctor do
    before do
      @doctor = FactoryBot.create(:doctor)
      #Doctor.create!(email: "jogoro@example.com", password: "password", password_confirmation: "password")
    end
    it "Create action checker" do
      post "/doctors/sign_in", params: { phone: @doctor.phone, password: @doctor.password }
      expect(response).to have_http_status(200)
    end
  end
end