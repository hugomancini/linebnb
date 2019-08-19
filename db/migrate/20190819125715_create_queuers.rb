class CreateQueuers < ActiveRecord::Migration[5.2]
  def change
    create_table :queuers do |t|
      t.string :address
      t.text :description
      t.integer :radius
      t.integer :price_per_hour
      t.integer :rating
      t.string :picture

      t.timestamps
    end
  end
end
