class AddPhoneToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :phone, :string
  end
end
