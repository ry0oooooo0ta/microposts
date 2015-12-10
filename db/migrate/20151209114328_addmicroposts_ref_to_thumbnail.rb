class AddmicropostsRefToThumbnail < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.references :micropost, index: true, foreign_key: true
      t.string :image
    end
  end
end