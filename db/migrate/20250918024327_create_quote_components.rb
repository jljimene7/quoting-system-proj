class CreateQuoteComponents < ActiveRecord::Migration[8.0]
  def change
    create_table :quote_components do |t|
      t.integer :quantity
      t.decimal :price_at_quote_time
      t.text :customizations
      t.references :quote, null: false, foreign_key: true
      t.references :component, null: false, foreign_key: true

      t.timestamps
    end
  end
end
