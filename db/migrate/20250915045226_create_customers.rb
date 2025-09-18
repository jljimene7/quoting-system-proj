class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.string :industry

      t.timestamps
    end
  end
end
