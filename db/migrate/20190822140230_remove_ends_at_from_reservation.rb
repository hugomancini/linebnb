class RemoveEndsAtFromReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :ends_at, :datetime
  end
end
