class CreateMassEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :mass_emails do |t|
      t.integer :admin_id
      t.string :subject
      t.text :context
      t.datetime :sent_at

      t.timestamps
    end
  end
end
