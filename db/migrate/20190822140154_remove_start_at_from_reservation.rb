class RemoveStartAtFromReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :starts_at, :datetime
  end
end
