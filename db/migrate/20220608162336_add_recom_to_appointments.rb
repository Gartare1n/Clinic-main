class AddRecomToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :recom, :text
  end
end
