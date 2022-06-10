class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
        
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :phone, presence: true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
  validates_uniqueness_of :phone, case_sensitive: false
  validates :password, presence: true

  has_many :doctor_categories
  has_many :categories, through: :doctor_categories

  has_many :appointments

  def password_required?
    new_record? ? false : super
  end

  has_one_attached :avatar
  
end
