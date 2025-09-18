class CreatePricingSheets < ActiveRecord::Migration[8.0]
  def change
    create_table :pricing_sheets do |t|
      t.string :price_type
      t.decimal :price
      t.date :effective_date
      t.references :component, null: false, foreign_key: true

      t.timestamps
    end
  end
end
