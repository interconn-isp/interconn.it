class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name, null: false
      t.string :phone
      t.string :email, null: false
      t.text :message, null: false
      t.string :source_ip, null: false
      t.boolean :processed, null: false, default: false

      t.timestamps
    end
  end
end
