class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.text :nom
      t.text :email
      t.text :telephone
      t.text :message

      t.timestamps
    end
  end
end
