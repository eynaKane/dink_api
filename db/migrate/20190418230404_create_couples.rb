class CreateCouples < ActiveRecord::Migration[5.2]
  def change
    create_table :couples do |t|
      t.string :username, null: false
      t.integer :number_of_kids, null: false
      t.timestamps
    end

    add_index :couples, :username, unique: true
  end
end
