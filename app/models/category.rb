
class Category < ApplicationRecord
  has_many :doctor_categories
  has_many :doctors, through: :doctor_categories
  validates :name, presence: true, length: {minimum:3, maximum:25}
  validates_uniqueness_of :name, case_sensitive: false
end