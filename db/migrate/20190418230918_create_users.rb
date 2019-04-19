class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :full_name, null: false
      t.integer :income_cents, default: 0, null: false
      t.references :couple, foreign_key: true, null: false

      t.timestamps
    end
  end
end
