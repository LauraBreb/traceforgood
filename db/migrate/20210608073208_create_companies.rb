class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :proof
      t.string :category
      t.string :product_positioning
      t.string :customer_positioning
      t.string :market_positioning
      t.string :csr_maturity
      t.references :administrator, index: true

      t.timestamps
    end
  end
end
