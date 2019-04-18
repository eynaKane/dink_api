class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :income_cents
      t.references :couple, foreign_key: true

      t.timestamps
    end
  end
end
