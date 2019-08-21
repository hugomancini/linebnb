class AddCoordinatestoQueuers < ActiveRecord::Migration[5.2]
  def change
    add_column :queuers, :latitude, :float
    add_column :queuers, :longitude, :float
  end
end
