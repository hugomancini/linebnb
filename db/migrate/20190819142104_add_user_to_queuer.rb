class AddUserToQueuer < ActiveRecord::Migration[5.2]
  def change
    add_reference :queuers, :user, foreign_key: true
  end
end
