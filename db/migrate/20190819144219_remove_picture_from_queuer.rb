class RemovePictureFromQueuer < ActiveRecord::Migration[5.2]
  def change
    remove_column :queuers, :picture, :string
  end
end
