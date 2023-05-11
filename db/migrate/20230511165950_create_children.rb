class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.integer :parent_id

      t.timestamps
    end
  end
end
