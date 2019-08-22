class AddStartAtToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :starts_at, :string
  end
end
