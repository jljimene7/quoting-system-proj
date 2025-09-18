class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.string :status
      t.text :problem_statement
      t.text :specifications
      t.text :machine_configuration
      t.decimal :margin_percentage
      t.decimal :margin_amount
      t.decimal :total_price
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
