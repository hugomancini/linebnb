class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :user, foreign_key: true
      t.references :queuer, foreign_key: true
      t.text :content
      t.string :address

      t.timestamps
    end
  end
end
