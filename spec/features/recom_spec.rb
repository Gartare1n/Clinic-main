require 'rails_helper'

RSpec.describe "Recommendation Features" do
  it 'Creating a doctor and writing a recommendation' do
    #Doctor.create(email: "jack@example.com", password: "password1")
    #Patient.create(email: "john@example.com", password: "password2")
    #Appointment.create(subject: "Test", doctor_id: "1", patient_id: "1")
    @doctor = FactoryBot.create(:random_doctor)
    @patient = FactoryBot.create(:random_patient)
    Appointment.create(subject: "Test", doctor_id: "1", patient_id: "1")
    visit new_doctor_session_path
    fill_in :doctor_phone, with: @doctor.phone
    fill_in :doctor_password, with: @doctor.password
    click_on 'Log in'
    expect(page).to have_content('Show')
    click_link('Show')
    expect(page).to have_content('Subject')
    fill_in :appointment_recom, with: 'This test Doctors Recommendation'
    click_on 'Submit'

  end
  
end