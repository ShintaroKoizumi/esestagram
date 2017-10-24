class ChangeDatatypeImageOfPic < ActiveRecord::Migration[5.1]
  def change
    change_column :pics, :image, :string
  end
end
