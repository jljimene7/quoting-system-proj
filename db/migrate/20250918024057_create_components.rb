class CreateComponents < ActiveRecord::Migration[8.0]
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price_vendor
      t.decimal :unit_price_internal
      t.text :customizable_attributes
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
