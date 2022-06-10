# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Doctor.create!(email: 'doctor1@example.com', password: 'doctor1', password_confirmation: 'doctor1') if Rails.env.development?
Patient.create!(email: 'patient1@example.com', password: 'patient1', password_confirmation: 'patient1') if Rails.env.development?