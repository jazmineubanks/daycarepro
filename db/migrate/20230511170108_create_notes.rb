class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :child_id
      t.integer :admin_id
      t.text :context
      t.boolean :submitted

      t.timestamps
    end
  end
end
