class AddPictureToCroaks < ActiveRecord::Migration
  def change
    add_column :croaks, :picture, :string
  end
end
