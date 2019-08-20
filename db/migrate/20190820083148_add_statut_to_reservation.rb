class AddStatutToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :statut, :string
  end
end
