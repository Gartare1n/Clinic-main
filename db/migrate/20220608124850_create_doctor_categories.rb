class CreateDoctorCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_categories do |t|
      t.integer :doctor_id
      t.integer :category_id
      t.timestamps
    end
  end
end
