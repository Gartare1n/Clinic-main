class Appointment < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 50, too_long: '50 characters in subject is the maximum allowed.'  }
  
  belongs_to :doctor
  belongs_to :patient

  def self.find_in_appointments(role, id)
    if role == 'Patient'
      where(patient_id: id)
    elsif role == 'Doctor'
      where(doctor_id: id)
    end
  end
end