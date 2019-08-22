class AddEndsAtToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :ends_at, :string
  end
end
