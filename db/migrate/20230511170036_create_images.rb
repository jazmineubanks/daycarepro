class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :child_id
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
